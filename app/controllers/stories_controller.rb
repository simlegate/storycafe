# -*- coding: utf-8 -*-
class StoriesController < ApplicationController

  before_filter :authenticate_user!

  def index
    render "index" , :locals => { :resources => init_resources }
  end

  # POST /stories
  # POST /stories.json
  def create
     render :json => Story.add_story(params[:story])
     
    #render :json => Story.create(status: "22")
  end


  # GET /stories/1/edit
  def edit
    session[:current_story] = Story.get_story_by_story_id(params[:id]) if params[:id] != session[:current_story].id
    render "index" , :locals => {  :resources => init_resources(params[:id]) }
  end

  # put/:id def update
  def update
     # 注意update_attribute 没有s
     Story.find(params[:id]).update_attribute(:description,params[:description])
     # to_json 不知道何时不加
     render :json => "autosave success!".to_json
   end
 
   # change status of story
   def change_status 
     result = Story.set_story_status params[:story_id],params[:status]
     result ? (render :json => "success".to_json) : (render :json => "false".to_json)
   end

end
