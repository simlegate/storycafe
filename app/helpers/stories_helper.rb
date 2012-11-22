module StoriesHelper
  def current_group
    session[:current_story]
  end
end
