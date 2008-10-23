module Merb
  module MerbAuthSlicePasswordReset
    module MailerHelper

      def password_reset_url(user)
        @password_reset_host      ||= MaSPR[:password_reset_host] || MaSPR[:default_password_reset_host]
        @password_reset_protocol  ||= MaSPR[:password_reset_protocol] || "http"

        if base_controller # Rendering from a web controller
          @password_reset_host      ||= base_controller.request.host
          @password_reset_protocol  ||= "http"
        end

        @password_reset_host ||= case @password_reset_host
        when Proc
          @password_reset_host.call(user)
        when String
          @password_reset_host
        end

        raise  "There is no host set for the password-reset email. Set Merb::Slices::config[:merb_auth_slice_password_reset][:password_reset_host]" unless @password_reset_host

        "#{@password_reset_protocol}://#{@password_reset_host}#{slice_url(:reset_password, :password_reset_code => user.password_reset_code)}"
      end

    end # MailerHelper
  end # MerbAuthSlicePasswordReset
end # Merb
