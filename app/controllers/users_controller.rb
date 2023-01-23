class UsersController < ApplicationController
  before_action :ensure_normal_user, only: %i[update destroy]
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.user_classification_id = 1
    @user.company_name = "株式会社修能塾"

    if @user.save
      flash[:success] = I18n.t("activerecord.errors.models.user.message.create.successful")
      redirect_to login_path
    else
      flash[:danger] = I18n.t("activerecord.errors.models.user.message.create.failed")
      render "new"
    end
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

  def destroy
    User.find_by(id: params[:id]).destroy!
    flash[:success] = I18n.t("activerecord.errors.models.user.message.destroy.success")
    redirect_to root_path
  end

  private

    def ensure_normal_user
      if current_user.email == "guest@example.com"
        flash[:danger] = I18n.t("guest_login.fail")
        redirect_to user
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :password, :prefecture, :address, :municipality, :apartments, :phone_number,
                                   :password_digest, :company_name, :user_classification_id)
    end
end
