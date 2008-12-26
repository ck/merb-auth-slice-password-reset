class MerbAuthSlicePasswordReset::Passwords <  MerbAuthSlicePasswordReset::Application

  private

  def redirect_after_password_reset
    redirect "/", :message => {:notice => "New password sent".t}
  end
  
  def redirect_after_sending_confirmation
    redirect "/", :message => {:notice => "Password Reset confirmaation sent".t}
  end

end # MerbAuthSlicePasswordReset::Passwords
