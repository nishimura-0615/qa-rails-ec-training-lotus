class ProductsController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @product = Product.find_by(id: params[:id])
  end
end
