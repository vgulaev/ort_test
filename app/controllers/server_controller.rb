class ServerController < ApplicationController
  def destroy
    id = params['id'].to_i
    server = Server.find_by(id: id)
    server.destroy if !server.nil?
    render :json => {}, :status => 200
  end
end
