module GroupsHelper
  def current_group *id
   id[0] ? session[:current_group] = Group.find(id[0]) : session[:current_group]
  end
end
