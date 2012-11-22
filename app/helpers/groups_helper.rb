module GroupsHelper
  def current_group *id
    id[0] ? id[0]==session[:current_group].id ? session[:current_group] : (session[:current_group] = Group.get_group_by_group_id(id[0])) :  session[:current_group]
  end
end
