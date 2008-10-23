class MerbAuthSlicePasswordReset::Passwords <  MerbAuthSlicePasswordReset::Application

  private

  def redirect_after_password_reset
    redirect "/", :message => {:notice => "Password Reset Successful"}
  end

end # MerbAuthSlicePasswordReset::Passwords
