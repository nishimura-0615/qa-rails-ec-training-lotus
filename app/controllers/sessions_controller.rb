class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  def guest_sign_in
    user = User.guest
    log_in user
    redirect_to user
    flash.now[:success] = I18n.t("guest_login.success")
  end
end
