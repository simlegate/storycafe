# -*- coding: utf-8 -*-
class GroupsController < ApplicationController
  helper :groups
  def index
     render :json =>  Group.create(params[:group])
  end

  def edit
    session[:current_group] = Group.get_group_by_group_id(params[:id]) if params[:id] != session[:current_group].id
    render "index" , :locals => {   :resources => init_resources(params[:id]) }
  end
end
