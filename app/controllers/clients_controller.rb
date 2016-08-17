class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @apps = App.all.includes(:clients)
  end

  def show
    
  end


private

  def set_client
    @client = Client.find(params[:id])
  end


  def client_params
    params.require(:client).permit(:name, :abbreviated_name, :app_id)
  end

end
