module Merb
  class Authentication
    module Mixins
      module SenileUser
        module SQClassMethods
          def self.extended(base)
            def find_with_password_reset_code(code)
              self[:password_reset_code => code]
            end
            def find_with_login_param(param_name, value)
              self[param_name => value]
            end
          end # self.extended
        end # SQClassMethods
        module SQInstanceMethods
        end # SQInstanceMethods
      end # SenileUser
    end # Mixins
  end # Authentication
end # Merb
