require 'spec_helper'

describe Story do
  
  
  let :attrs do
     {
      :user => 'simlegate',
      :title     => 'hi,world',
      :description    => 'this is a test story',
      :current_status => "new",
      :next_status => "started" 
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
      Story.destroy_all
      @group = Group.add_group(title: "public")
      @story = @group.stories.create!(attrs)
    end

    context "get stories by group id " do
      
      before (:each) do
        @s = Story.get_stories_by_group_id(@group.id)
      end

      it "hash.length should == 4" do
        @s.length.should == 4 
      end
     
      it "type of result is Hash" do 
        @s.should be_instance_of Hash
      end 

      it "should hava key new,started,review,finished" do
        Rails.configuration.status.each do |c|
          @s.should have_key(c.to_sym)
        end
      end

    end
    it "create a story" do 
      Story.add_story(attrs).should be_valid     
    end

    it "get stories of default group" do
      stories = Group.get_default_group.stories
      expect(Story.get_default_stories).to eq(stories)
    end
    
    it "get story by story id" do
      expect(Story.get_story_by_story_id(@story.id)).to eq(@story)
    end

    it "set story status" do
      Story.set_story_status(@story.id,"review","new").should be_true 
    end

    it "get stories by groupid and current status " do
     # expect(Story.get_stories_by_groupid_and_current_status(@story.group_id,"new")).to eq(@story)
     Story.get_stories_by_groupid_and_currentstatus(@story.group_id,"new").should include(@story)
    end

  end

end

