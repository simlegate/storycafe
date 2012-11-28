module ApplicationHelper

  def get_channel_path
    "/channels/#{current_project.id}"
  end

end
