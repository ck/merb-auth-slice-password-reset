module Merb
  class Authentication
    module Mixins
      # This mixin provides basic password-reset functionality for senile users.
      #
      # Added properties:
      #  :password_reset_code, String
      #
      # To use it simply require it and include it into your user class.
      #
      # class User
      #   include Merb::Authentication::Mixins::SenileUser
      #
      # end
      #
      module SenileUser
        def self.included(base)
          base.class_eval do
            include Merb::Authentication::Mixins::SenileUser::InstanceMethods
            extend  Merb::Authentication::Mixins::SenileUser::ClassMethods

            path = File.expand_path(File.dirname(__FILE__)) / "senile_user"
            if defined?(DataMapper) && DataMapper::Resource > self
              require path / "dm_senile_user"
              extend(Merb::Authentication::Mixins::SenileUser::DMClassMethods)
            elsif defined?(ActiveRecord) && ancestors.include?(ActiveRecord::Base)
              require path / "ar_senile_user"
              extend(Merb::Authentication::Mixins::SenileUser::ARClassMethods)
            elsif defined?(Sequel) && ancestors.include?(Sequel::Model)
              require path / "sq_senile_user"
              extend(Merb::Authentication::Mixins::SenileUser::SQClassMethods)
            end

          end # base.class_eval
        end # self.included

        module ClassMethods
          def make_key
            Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
          end
        end # ClassMethods

        module InstanceMethods
          
          def reset_password!
            self.password = self.password_confirmation = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )[0, 7]
            self.save
            send_new_password
          end

          def generate_password_reset_code
            pwreset_key_success = false
            until pwreset_key_success
              self.password_reset_code = self.class.make_key
              self.save
              pwreset_key_success = self.errors.on(:password_reset_code).nil? ? true : false 
            end
          end

          def password_reset?
            ! self.password_reset_code.nil?
          end

          def clear_reset_password!
            self.password_reset_code = nil
            self.save
          end

          # Sends out the password reset notification.
          # Used 'Request to change your password' as subject if +MaSFP[:password_reset_subject]+ is not set.
          def send_password_reset_notification
            generate_password_reset_code
            deliver_password_reset_email(:password_reset, :subject => (MaSPR[:password_reset_subject] || "Request to change your password"))
          end
          
          def send_new_password
            deliver_password_reset_email(:new_password, :subject => (MaSPR[:new_password_subject] || "Your new password"))
          end

          private

          # Helper method delivering the email.
          def deliver_password_reset_email(action, params)
            from = MaSPR[:from_email]
            raise "No :from_email option set for Merb::Slices::config[:merb_auth_slice_password_reset][:from_email]" unless from
            MaSPR::PasswordResetMailer.dispatch_and_deliver(action, params.merge(:from => from, :to => self.email), :user => self)
          end

        end # InstanceMethods

      end # SenileUser
    end # Mixins
  end # Authentication
end # Merb
