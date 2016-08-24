class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @apps = App.all.includes(:clients)
  end

  def show

  end

  def destroy
    @client.destroy
    flash[:primary] = "Client Deleted Successfully"
    redirect_to clients_path
  end

  def new
    @app = App.find(params[:app_id])
    @client = @app.clients.new
  end

  def create
    @client = Client.new(client_params)
    @app = @client.app
    if @client.save
      flash[:primary] = "New Client Created Successfully"
      redirect_to clients_path
    else
      flash[:alert] = @client.errors.full_messages.join(', ')
      render :new
    end
  end


private

  def set_client
    @client = Client.find(params[:id])
  end


  def client_params
    params.require(:client).permit(:name, :abbreviated_name, :app_id)
  end

end
