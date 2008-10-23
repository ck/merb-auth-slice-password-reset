require File.dirname(__FILE__) + '/../spec_helper'

describe "PasswordResetMailer" do

  before(:all) do
    Merb::Router.prepare { add_slice(:merb_auth_slice_password_reset)}
    User.auto_migrate!
  end

  after(:all) do
    Merb::Router.reset!
  end

  describe MerbAuthSlicePasswordReset::PasswordResetMailer do

    def deliver(action, mail_opts= {},opts = {})
      MerbAuthSlicePasswordReset::PasswordResetMailer.dispatch_and_deliver action, mail_opts, opts
      @delivery = Merb::Mailer.deliveries.last
    end

    before(:each) do
      @u = User.new(:email => "homer@simpsons.com", :login => "homer", :password_reset_code => "12345")
      @mailer_params = { :from => "info@mysite.com", :to => @u.email, :subject => "Welcome to MySite.com" }
    end

    after(:each) do
      Merb::Mailer.deliveries.clear
    end

    it "should send mail to homer@simpsons.com for the password reset email" do
      deliver(:password_reset, @mailer_params, :user => @u)
      @delivery.assigns(:headers).should include("to: homer@simpsons.com")
    end

    it "should send the mail from 'info@mysite.com' for the the password reset email" do
      deliver(:password_reset, @mailer_params, :user => @u)
      @delivery.assigns(:headers).should include("from: info@mysite.com")
    end

    it "should mention the password reset link in the the password reset emails" do
      deliver(:password_reset, @mailer_params, :user => @u)
      the_url = MerbAuthSlicePasswordReset::PasswordResetMailer.new.slice_url(:reset_password, :password_reset_code => @u.password_reset_code)
      the_url.should_not be_nil
      @delivery.text.should include(the_url)
    end

  end

end
