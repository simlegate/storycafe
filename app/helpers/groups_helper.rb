module GroupsHelper
  def current_group
    session[:current_group]
  end
end
