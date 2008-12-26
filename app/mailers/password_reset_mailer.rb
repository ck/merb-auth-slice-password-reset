class MerbAuthSlicePasswordReset::PasswordResetMailer < Merb::MailController

  include Merb::MerbAuthSlicePasswordReset::MailerHelper

  controller_for_slice MerbAuthSlicePasswordReset, :templates_for => :mailer, :path => "views"

  def password_reset
    @user = params[:user]
    Merb.logger.info "Sending Password Reset to #{@user.email} with code #{@user.password_reset_code}"
    render_mail :layout => nil
  end
  
  def new_password
    @user = params[:user]
    Merb.logger.info "Sending New Password to #{@user.email} with password #{@user.password}"
    render_mail :layout => nil
  end

end
