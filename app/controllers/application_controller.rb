# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  def init
     session[:current_group] = Group.get_group_default   if session[:current_group].nil?
     session[:current_groups] = Group.get_groups_default   if session[:current_groups].nil?
     session[:current_story] = Story.get_story_default   if session[:current_story].nil?
     session[:current_storys] = Story.get_stories_by_group_id session[:current_group].id  if session[:current_storys].nil?
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
