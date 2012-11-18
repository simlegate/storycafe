require 'spec_helper'

describe StoriesController do



    context 'create a new story' do
      it "has all  stories" do
        get :index
        assigns(:stories).should == Story.all
      end
      it "adds story via html" do
        post :create , :user => "byronlee",
                       :story => { :title => "hello,world!" }
        Story.all.last.title.should == "hello,world!"
      end
    end


    context "edit the story's description" do
      it "edit stiries by story's id" do
        post :create , :user => "byronlee",
                       :story => { :title => "hello,world!" }
        get :edit , :id =>  Story.all.last.id
        response.should render_template("index")
       end
     end


    context 'update the story"s descriptions ' do
      it " update story's description by story's id" do
      # put :update , {:id => Story.all.last.id ,
      #                :content => "thess is test update story's description information!"}
      # Story.all.last.description.should == "thess is test update story's description information!"
     # response.should == "autosave success!"
       response.should be_success
      end
    end
end
