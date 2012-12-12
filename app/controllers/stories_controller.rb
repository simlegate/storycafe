# -*- coding: utf-8 -*-
class StoriesController < ApplicationController

  before_filter :authenticate_user!

  def index
    render "index" , :locals => { :resources => init_resources }
  end

  def create
   #  log = Log.new_message "#{current_user.email} create a story of '#{params[:story][:title]}'"
     #用调用方法的形式不可用
     #publish_message("messages/new",log)
  #   PrivatePub.publish_to("/channels/#{session[:current_project].id}", message: log)

  #    result = Story.add_story(params[:story])
      result = Story.get_story_default
      respond_to do |format|
         format.html { render  :_every_story_in_table , locals: {  story:  result } ,:layout => false }
      end
  end

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
     PrivatePub.publish_to(get_channel_path, message: log)
     result = Story.set_story_status params[:story_id],params[:status],next_status
     result ? (render :json => "success") : (render :json => "false".to_json)
   end

end
