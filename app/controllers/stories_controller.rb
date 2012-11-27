# -*- coding: utf-8 -*-
class StoriesController < ApplicationController

  before_filter :authenticate_user!

  def index
    render "index" , :locals => { :resources => init_resources }
  end

  # POST /stories
  # POST /stories.json
  def create
     log = Log.new_message "simlegate create a story of '#{params[:story][:title]}'"
    #publish_message("messages/new",log)
     PrivatePub.publish_to("/messages/new", message: log)
     render :json => Story.add_story(params[:story])
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
   # params[:status] stand for next status
   def change_status 
     story = Story.get_story_by_story_id(params[:story_id])
     next_status = get_next_status(params[:status])
     log = Log.new_message "#{story.title} be to #{params[:status]} by #{current_user.email}" 
     PrivatePub.publish_to("/messages/new", message: log)
     result = Story.set_story_status params[:story_id],params[:status],next_status
     result ? (render :json => "success".to_json) : (render :json => "false".to_json)
   end

   def check
     PrivatePub.publish_to("/messages/new", message: "success")
     render :json => "22".to_json
   end

end
