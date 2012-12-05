# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  def init
     session[:current_group] = Group.get_default_group   if session[:current_group].nil?
     session[:current_story] = Story.get_default_stories   if session[:current_story].nil?
  end


  def get_stories *id
    # id[0] ? ( Story.get_stories_by_group_id(id[0]) ? Story.get_stories_by_group_id(id[0]) : Story.get_stories_by_story_id(id[0]) ) :  Story.get_stories_public
  end


  def init_resources *id
   result = {   :group   => Group.all  ,
               :stories =>  get_stories(id[0])
            }
  end

  # get next status by current status
  def get_next_status current_status
    status = %w[new started review finished]
    tmp = nil
    status.each_with_index do |s,i|
      tmp = i+1  if s == current_status
    end
    status[tmp] ? status[tmp] : "new"
  end

  def current_project
    session[:current_project] ? session[:current_project] : session[:current_project] = Project.get_default_project
  end

  def get_channel_path
    "#{Rails.configuration.channel_prefix}/#{current_project.id}"
  end

end
