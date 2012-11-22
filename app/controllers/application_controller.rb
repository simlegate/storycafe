# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery


  def get_description *id
    id[0] ? ( Story.get_story_description_by_story_id(id[0]).exists? ? Story.get_story_description_by_story_id(id[0]) :Group.get_group_description_by_group_id(id[0])  ) :  Story.get_story_description_default
  end


  def get_stories *id
      id[0] ? ( Story.get_stories_by_group_id(id[0]).exists? ? Story.get_stories_by_group_id(id[0]) : Story.get_stories_by_story_id(id[0]) ) :  Story.get_stories_public
  end


  def init_resources *id
     result = {   :group => {:data => Group.all } ,
                  :stories => {:data =>  get_stories(id[0]) } ,
                  :description =>{:data =>  get_description(id[0])}  }

  end

end
