class TagsController < ApplicationController
  before_action :check_user

  def index
    @tags = Tag.all
  end

  def create
    @new_tag = Tag.create(name: params[:tag][:name])
    respond_to do |format|
      format.js
    end
  end

  def update
    Tag.find_by(id: params[:id]).update(name: params[:tag][:name])
    redirect_to tags_path
  end

  def edit
    @editin_tag = Tag.find_by(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Tag.find_by(id: params[:id]).destroy
    redirect_to tags_path
  end

  private
    def check_user
      unless current_user.admin
        redirect_to '/'
      end
    end
end
