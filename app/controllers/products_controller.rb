class ProductsController < ApplicationController
  before_action :check_user

  def index
    @products = Product.all
  end

  def create
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
  end

  private
    def products_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :password)
    end

    def check_user
      unless current_user.admin
        redirect_to '/'
      end
    end
end
