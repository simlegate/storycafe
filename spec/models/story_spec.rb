require 'spec_helper'

describe Story do
  
  before(:all) do 
    Story.destroy_all
    Group.add_group(title: "public")
  end
  
  let :attrs do
     {
      :user => 'simlegate',
      :title     => 'hi,world',
      :description    => 'this is a test story',
     }
  end

  describe "field" do
    it "should include Mongoid::Timestamps::Created not Updated" do
      should be_timestamped_document.with(:created)
      should_not be_timestamped_document.with(:updated)
    end
  
    it "should have user,title,description,created_at..." do
      tmp = { :_id => Moped::BSON::ObjectId,
              :user => String,
              :title => String,
              :description => String , 
              :list_id => Integer ,
              :current_status => String,
              :next_status => String
            }
      tmp.each do |k,v|
        should have_fields(k).of_type(v)
      end
    
      should have_fields(:current_status).with_default_value_of("new")
      should have_fields(:next_status).with_default_value_of("started")
    end

    it "the type of created_at is Time but Date" do
      should_not have_fields(:created_at).of_type(Date)
      should have_fields(:created_at).of_type(Time)
    end

    it "hava relation of n-1 between stories and group" do
    should belong_to(:group)
    end

    it "hava relation of n-1 between stories and user" do
    should belong_to(:user)
    end
  end  
  
  describe "function" do 
    before (:each) do
      @stories = Group.get_default_group.stories
    end

    it "create a story" do 
      Story.add_story(attrs).should be_valid     
    end

    it "get stories by group id" do
      
    end

    it "get stories of default group" do
      expect(Story.get_stories_public).to eq(@stories)
    end
    
    it "get story by story id" do
      
    end
  end





end

