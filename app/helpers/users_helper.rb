# -*- coding: utf-8 -*-
module UsersHelper
  def current_member
    current_user.id
  end

  def get_user_name_by_user_id id
    id ? User.find(id).name : "No user"
  end
end
