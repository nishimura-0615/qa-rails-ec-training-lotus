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
      flash[:success] = I18n.t("activerecord.errors.models.user.message.update.success")
      redirect_to @user
    else
      flash.now[:danger] = I18n.t("activerecord.errors.models.user.message.update.danger")
      render "users/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,:zipcode , :prefecture, :address, :municipality, :apartments, :phone_number, :password_digest, :company_name, :user_classification_id)
  end
end
