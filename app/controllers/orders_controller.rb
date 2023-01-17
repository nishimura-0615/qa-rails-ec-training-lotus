class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def destroy
    @order = Order.find_by(id: params[:id]).destroy!
    # TODO:注文履歴ページの実装時に対応したリンクにリダイレクトする様に修正
    redirect_to order_path
  end
end
