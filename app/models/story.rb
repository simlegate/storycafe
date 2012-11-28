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
  field :current_status, type: String , default: "new" 
  field :next_status, type: String , default: "started" 

  def self.add_story params_story
    create(params_story)
  end

  def self.get_stories_by_group_id id
    result = {
               :new       => where(group_id: id,current_status: "new"),
               :started   => where(group_id: id,current_status: "started"),
               :review    => where(group_id: id,current_status: "review"),
               :finished  => where(group_id: id,current_status: "finished")
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
  def self.set_story_status id,current_status,next_status
    find(id).update_attributes(current_status:current_status,next_status:next_status)
  end

end
