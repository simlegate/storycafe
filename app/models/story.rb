# -*- coding: utf-8 -*-
class Story
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user
  field :title
  field :description
  belongs_to :group
  belongs_to :user

  def self.add_story params_story
    Story.create(params_story)
  end

  def self.get_stories_by_group_id id
    where(group_id: id)
  end

  def self.get_stories_by_story_id id
    where(group_id: Story.where(_id: id).first.nil? ? "" : Story.where(_id: id).first.group_id )
  end

  def self.get_stories_public
    result =  Group.find_by(title: "public")
    result.nil?  ?  nil : result.stories
  end

  def self.get_story_by_story_id id
    where(_id: id)
  end



  def self.get_story_default
    result = Group.find_by(title: "public")
    result.nil?  ?  nil :  result.stories.first
   end
end
