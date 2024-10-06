class ProductsController < ApplicationController
  def index
    # list all the products and include the category associate
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.find(params[:id])
  end

end
