# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  def init
     session[:current_group] || session[:current_group] = Group.get_default_group 
     session[:current_story] || session[:current_story] = Story.get_default_story 
  end

  # get next status by current status
  def get_next_status current_status
   status = Rails.configuration.status  
   status[status.index(current_status)+1] || "finished"
  end

  def current_project
    session[:current_project] || session[:current_project] = Project.get_default_project
  end

  def get_channel_path
    "#{Rails.configuration.channel_prefix}/#{current_project.id}"
  end

end
