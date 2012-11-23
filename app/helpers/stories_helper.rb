module StoriesHelper
  def current_story
    session[:current_story]
  end
  
  def get_story_status number
    %w[new started review finished][number-1]
  end

end
