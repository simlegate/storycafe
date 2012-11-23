# -*- coding: utf-8 -*-
class Story
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user
  field :title
  field :description
  belongs_to :group
  belongs_to :user
  auto_increment :list_id,:seed => 0, :collection => "story_list_ids" 
  field :status, type: Integer , default: 1 

  def self.add_story params_story
    Story.create(params_story)
  end

  def self.get_stories_by_group_id id
    result = {
               :new       => where(group_id: id,status: 1),
               :started   => where(group_id: id,status: 2),
               :review    => where(group_id: id,status: 3),
               :finished  => where(group_id: id,status: 4)
              }
  end

  def self.get_stories_by_story_id id

    where(group_id: Story.where(_id: id).first.nil? ? "" : Story.where(_id: id).first.group_id )
  end

  def self.get_stories_public
    result =  Group.find_by(title: "public")
    result.nil?  ?  nil : result.stories
  end

  def self.get_story_by_story_id id
    find(id)
  end

  def self.get_story_default
    result = Group.find_by(title: "public")
    result.nil?  ?  nil :  result.stories.first
  end
  
  # id : story_id
  # status : current_status
  def self.set_story_status id,status
    find(id).update_attribute(:status,status)
  end

end
