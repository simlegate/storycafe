module StoriesHelper
  def current_story
    session[:current_story]
  end
end
