class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    if @order.prepared?
      @order.destroy!
      flash[:success] = I18n.t("activerecord.errors.models.order.message.destroy.success")
      redirect_to root_path
    else
      flash.now[:danger] = I18n.t("activerecord.errors.models.order.message.destroy.eroor")
      render "show"
    end
  end
end
