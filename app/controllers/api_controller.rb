class ApiController < ApplicationController
  def server
    render :json => Server.all
  end

  def bandwidth
    result = [] if params[:server].nil?
    render :json => Bandwidth.where(:server_id => params[:server].to_i).all
  end
end
