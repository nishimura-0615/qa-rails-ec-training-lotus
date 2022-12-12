class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update!(user_params)
      flash[:success]
      redirect_to @user
    else
      flash.now[:danger]
      render "users/edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end
end
