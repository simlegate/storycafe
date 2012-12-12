# -*- coding: utf-8 -*-
class StoriesController < ApplicationController

  before_filter :authenticate_user!

  def index
    render "index"
  end

  def create
   #  log = Log.new_message "#{current_user.email} create a story of '#{params[:story][:title]}'"
     #用调用方法的形式不可用
     #publish_message("messages/new",log)
  #   PrivatePub.publish_to("/channels/#{session[:current_project].id}", message: log)

     stories = Story.get_stories_by_group_id session[:current_group].id
     respond_to do |format|
             stories[:new].empty? ?
              format.html { render  :_stories_in_status , locals: { resource: [Story.add_story(params[:story])] ,type: "new" } ,:layout => false } :
              format.html { render  :_every_story_in_table , locals: {  story:  Story.add_story(params[:story]) } ,:layout => false };
       end

  end

  def edit
    session[:current_story] = Story.get_story_by_story_id(params[:id]) if params[:id] != session[:current_story].id
    render "index" 
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
      next_status = get_next_status(params[:next_status])

     stories = Story.get_stories_by_group_id session[:current_group].id

     # log = Log.new_message "#{story.title} be to #{params[:status]} by #{current_user.email}"
     # PrivatePub.publish_to(get_channel_path, message: log)


     respond_to do |format|
             stories[params[:next_status].to_sym].empty? ?
              format.html { render  :_stories_in_status , locals: { resource: [ Story.set_story_status(params[:story_id],params[:next_status],next_status)] ,type: params[:next_status] } ,:layout => false } :
              format.html { render  :_every_story_in_table , locals: {  story: Story.set_story_status(params[:story_id],params[:next_status],next_status)} ,:layout => false }
       end
   end

end
