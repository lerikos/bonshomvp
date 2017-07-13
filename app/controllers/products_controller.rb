class ProductsController < ApplicationController
  before_action :check_user

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      params[:product][:tags].each do |tag|
        result = Tag.find_by(name: tag)
        @product.product_tags.create(tag_id: result.id) if result
      end
      flash[:notice] = "Product was successfully created"
      NotificationSenderJob.perform_later(@product)
      redirect_to products_path
      else
      render 'new'
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      @product.product_tags.destroy_all
      params[:product][:tags].each do |tag|
        result = Tag.find_by(name: tag)
        @product.product_tags.create(tag_id: result.id) if result
      end
      flash[:success] = "Alert was successfully updated"
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.product_tags.destroy_all
    product.subscribers.destroy_all
    product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end

    def check_user
      unless current_user.admin
        redirect_to '/'
      end
    end
end
