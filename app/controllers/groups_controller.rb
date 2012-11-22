# -*- coding: utf-8 -*-
class GroupsController < ApplicationController
     render :json =>  Group.create(params[:group])
  end

  def edit
    current_group(param[:id]) 
    render "index" , :locals => {   :resources => init_resources(params[:id]) }
  end
end
