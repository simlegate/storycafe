# -*- coding: utf-8 -*-
class StoriesController < ApplicationController

  before_filter :authenticate_user!

  def index
    render "index" , :locals => {   :resources => init_resources }
  end

  # POST /stories
  # POST /stories.json
  def create
     render :json => Story.add_story(params[:story])
  end


  # GET /stories/1/edit
  def edit
    render "index" , :locals => {   :resources => init_resources(params[:id]) }
  end


 # put/:id
   def update
       Story.where(_id: params[:id]).update(description: params[:content])
       render :json => "autosave success!"
   end
end
