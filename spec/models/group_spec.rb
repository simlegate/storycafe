require 'spec_helper'

describe Group do

  before(:each) do 
    Group.destroy_all
  end

  let :attrs do
     {
      :user => 'byronlee',
      :title     => 'public',
      :description    => 'this is a public group',
     }
  end

  describe "field" do
    it "should include Mongoid::Timestamps::Created not Updated" do
      should be_timestamped_document.with(:created)
      should_not be_timestamped_document.with(:updated)
  end
    it "have fields and type is String" do
      tmp = { :_id => Moped::BSON::ObjectId,
              :user => String,
              :title => String,
               :description => String 
             }
      tmp.each do |k,v|
        should have_fields(k).of_type(v)
      end
    end
    
    it "the type of created_at is Time but Date" do
      should_not have_fields(:created_at).of_type(Date)
      should have_fields(:created_at).of_type(Time)
    end
     
    it "have relation of 1-n between Group and stories" do 
      should have_many(:stories).with_foreign_key(:group_id)
    end

  end

    describe "create a group" do
      it "create a group" do
        expect(Group.add_group(attrs).user).to eq("byronlee")
      end
    end
     
    describe "get default group" do 
      before(:each) do
        Group.create!(attrs)
        @group = Group.find_by(title: "public")
      end

      it "the public group is not nil" do
        @group.should_not be_nil 
      end

      it "the title of default group is public" do 
        expect(Group.get_default_group).to eq(@group)
      end
     end

     describe "get group" do
       before(:all) do
         @group = Group.create!(description: "get_group_by_group_id")
       end

       it "by group id" do
         expect(Group.get_group_by_group_id(@group.id).description).to eq("get_group_by_group_id")
       end
     end
end
