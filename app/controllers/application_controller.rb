# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  def init
     session[:current_group] = Group.get_group_default   if session[:current_group].nil?
     session[:current_story] = Story.get_story_default   if session[:current_story].nil?
  end


  def get_stories *id
      id[0] ? ( Story.get_stories_by_group_id(id[0]).exists? ? Story.get_stories_by_group_id(id[0]) : Story.get_stories_by_story_id(id[0]) ) :  Story.get_stories_public
  end


  def init_resources *id
     result = {   :group => {:data => Group.all } ,
                  :stories => {:data =>  get_stories(id[0]) } }
     end
end
