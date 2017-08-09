class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = storage.list_for(params[:page], params[:tag])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  private

  def storage
    Tag
  end


end
