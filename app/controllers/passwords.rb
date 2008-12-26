class MerbAuthSlicePasswordReset::Passwords <  MerbAuthSlicePasswordReset::Application

  after :redirect_after_password_reset, :only => [:reset]

  def forgot_password
    @login_param_name = Merb::Authentication::Strategies::Basic::Base.login_param
    render
  end
  
  def send_confirmation
    @login_param_name = Merb::Authentication::Strategies::Basic::Base.login_param
    @user = Merb::Authentication.user_class.find_with_login_param(@login_param_name, params[@login_param_name])
    if @user
      @user.send_password_reset_notification
      redirect_after_sending_confirmation
    else
      message[:error] = "User with #{@login_param_name} \"%s\" not found".t(params[@login_param_name])
      render :forgot_password
    end
  end

  def reset
    session.user = Merb::Authentication.user_class.find_with_password_reset_code(params[:password_reset_code])
    raise NotFound if session.user.nil?
    session.user.reset_password!
  end

  private

  def redirect_after_password_reset
    redirect "/", :message => {:notice => "Password Reset Successful".t}
  end
  
  def redirect_after_sending_confirmation
    redirect "/", :message => {:notice => "Password Reset confirmaation sent".t}
  end

end # MerbAuthSlicePasswordReset::Passwords
