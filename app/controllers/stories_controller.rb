class StoriesController < ApplicationController
  def index
  end

  def create
  Story.create(params[:story])

  end
end
