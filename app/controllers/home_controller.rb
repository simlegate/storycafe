class HomeController < ApplicationController
  def index
  @story = Story.new
  end

  def get
  render :json => "22"
  end

end
