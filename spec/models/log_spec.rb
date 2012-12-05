require 'spec_helper'

describe Log do

  context "field" do
    it "should include Mongoid::Timestamps::Created not Updated" do
      should be_timestamped_document.with(:created)
      should_not be_timestamped_document.with(:updated)
  end
    it "have fields and type is String" do
      tmp = { :_id => Moped::BSON::ObjectId,
              :content => String,
              :isread => Boolean,
             }
      tmp.each do |k,v|
        should have_fields(k).of_type(v)
      end
    end
    
    it "the type of created_at is Time but Date" do
      should_not have_fields(:created_at).of_type(Date)
      should have_fields(:created_at).of_type(Time)
    end
     
     it "have the relation n-1 between log and user" do
      should belong_to(:user).of_type(User).with_foreign_key(:user_id)
     end

  end

  context "function test" do
   let :attrs do
      {
        content: "simlegate has created a log"      
      }
    end
    before (:each) do
      Log.destroy_all
      @log = Log.create!(attrs)
    end
     
    it "create new message" do
      expect(Log.new_message("this is test").content).to eq("this is test")
    end

    it "set message isread" do 
      Log.set_message_isread(@log.id).should be_true
    end

    it "set message isread=false" do 
      Log.set_message_isread(@log.id,false).should be_true
    end

    it "get unread message" do
      Log.get_unread_message.should be_valid
    end
  end




end
