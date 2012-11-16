require 'spec_helper'

describe StoriesController do
  describe "Story-Rspec" do
    it "shows the index" do
       get :index
   #   collection.should == Stories.page(1)
    #  response.should be_success
   #  response.should render_template("ind")
    end
  end
end
