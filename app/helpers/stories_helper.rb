module StoriesHelper
  def current_story
    p "==============================="
    p session[:current_story]
    session[:current_story]
  end

  def get_story_status number
    %w[new started review finished][number-1]
  end

  def get_story_status_title type
   type=="stories_new" ? "new stories" :
   type=="stories_started" ? "stories is beginning" :
   type=="stories_review" ? "completed wait participant to review" : "finished and closed"

  end

  def get_story_next_status next_status
    next_status==2 ? "stories_started" :
    next_status==3 ? "stories_review" : "stories_finished"

  end

end
