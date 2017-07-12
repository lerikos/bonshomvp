class UsersController < ApplicationController
  def subscribe
    @tags = Tag.all
    @products = Product.all
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
end
