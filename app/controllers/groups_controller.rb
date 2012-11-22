# -*- coding: utf-8 -*-
class GroupsController < ApplicationController


  def create
     render :json =>  Group.create(params[:group])
  end


  def edit
    current_group params[:id]
    render "index" , :locals => {   :resources => init_resources(params[:id]) }
  end
end
