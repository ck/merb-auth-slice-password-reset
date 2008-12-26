module Merb
  class Authentication
    module Mixins
      module SenileUser
        module DMClassMethods
          def self.extended(base)
            base.class_eval do
              property :password_reset_code, String, :writer => :protected
            end # base.class_eval
            def find_with_password_reset_code(code)
              first(:password_reset_code => code)
            end
            
            def find_with_login_param(param_name, value)
              first(param_name => value)
            end
          end # self.extended
        end # DMClassMethods
      end # SenileUser
    end # Mixins
  end # Authentication
end #Merb