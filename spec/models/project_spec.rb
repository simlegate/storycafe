require 'spec_helper'

describe Project do

  context "field" do
    it "should include Mongoid::Timestamps::Created not Updated" do
      should be_timestamped_document.with(:created)
      should_not be_timestamped_document.with(:updated)
  end
    it "have fields and type is String" do
      tmp = { :_id => Moped::BSON::ObjectId,
              :name => String,
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
         name: "simlegate"
       }
    end 
    
    before(:each) do
      Project.destroy_all
      @project = Project.create!(attrs) 
    end

    it "create project" do
      pending("create project is not tested")
    end

    it "get default project which first project" do
      Project.get_default_project.name.should == "simlegate" 
    end

  end

end

