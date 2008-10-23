class MerbAuthSlicePasswordReset::Passwords <  MerbAuthSlicePasswordReset::Application

  after :redirect_after_password_reset

  # Resets the password for the user from the submitted password reset code.
  #
  # ==== Returns
  # String:: Empty string.
  def reset
    session.user = Merb::Authentication.user_class.find_with_password_reset_code(params[:password_reset_code])
    raise NotFound if session.user.nil?
    # if session.authenticated? && !session.user.activated?
    session.user.reset_password!
    # end
    ""
  end

  private

  def redirect_after_password_reset
    redirect "/", :message => {:notice => "Password Reset Successful"}
  end

end # MerbAuthSlicePasswordReset::Passwords
