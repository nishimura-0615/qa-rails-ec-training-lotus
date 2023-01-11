class UsersController < ApplicationController
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
    @user.user_classification_id =1
    if @user.save
      session[:user_id] = @user.id
      flash[:successful] = I18n.t("activerecord.errors.models.user.message.create.successful")
      redirect_to login_path
    else
      flash[:failed] = I18n.t("activerecord.errors.models.user.message.create.failed")
      render "users/new"
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

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :password, :prefecture, :address, :municipality, :apartments, :phone_number, :password_digest,
                    :company_name, :user_classification_id)
    end
end
