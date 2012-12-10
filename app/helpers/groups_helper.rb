module GroupsHelper
  def current_group
    session[:current_group]
  end

 def current_groups
    session[:current_groups]
 end

end
