class UsersController < ApplicationController
  before_action :check_user_loged

  def alerts
    @alerts = current_user.alerts
  end

  def profile
    @user = current_user
    @products = @user.products
    @tags = @user.tags
    @alerts = @user.alerts.first(5)
  end

  def subscribe
    @tags = Tag.all
    if @str = params[:search]
      @products = Product.all.select{|product| product.name.downcase.include?(@str)}
    else
      @products = Product.all
    end
  end

  def check_tag_follow
    preference = current_user.preferences.find_by(tag_id: params[:id].to_i)
    if preference
      preference.destroy
      added = false
    else
      current_user.preferences.create(tag_id: params[:id])
      added = true
    end
    respond_to do |format|
      format.json do render :json => {add: added} end
    end
  end

  def check_product_follow
    subscriber = current_user.subscribers.find_by(product_id: params[:id].to_i)
    if subscriber
      subscriber.destroy
      added = false
    else
      current_user.subscribers.create(product_id: params[:id])
      added = true
    end
    respond_to do |format|
      format.json do render :json => {add: added} end
    end
  end

  def search
    @str = params[:search]
    @products = Product.all.select{|product| product.name.downcase.include?(@str)}
    respond_to do |format|
      format.js
    end
  end

  private
    def check_user_loged
      redirect_to '/' unless current_user
    end
end
