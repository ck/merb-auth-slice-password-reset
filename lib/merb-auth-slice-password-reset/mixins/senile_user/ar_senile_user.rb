module Merb
  class Authentication
    module Mixins
      module SenileUser
        module ARClassMethods
          def self.extended(base)
            def find_with_password_reset_code(code)
              find(:first, :conditions => ["password_reset_code = ?", code])
            end          
          end # self.extended
        end # ARClassMethods
      end # SenileUser
    end # Mixins
  end # Authentication
end # Merb
