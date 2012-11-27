class ProjectsController < ApplicationController
  def create
    render :json => Project.create(params[:project])
  end
end
