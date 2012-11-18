class StoriesController < ApplicationController

  def index
    @story = Story.new
    @stories = Story.all
    @information  = Story.first
  end


  # POST /stories
  # POST /stories.json
  def create
    render :json => Story.create(user: "Byronlee" ,description: "", title: params[:story][:title])
  end


  # GET /stories/1/edit
  def edit
    @story = Story.new
    @stories = Story.all
    @story  = Story.find(params[:id])
    render "index"
   end

   def update
  #   @story = Story.new
  #   @stories = Story.all
   #   Story.find(params[:id]).update(description: params[:content])
       Story.where(_id: params[:id]).update(description: params[:content])
       Story.update_attributes(:story)
       render :json => "autosave success!"
  #   render "index"
   end
end
