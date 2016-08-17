class ClientsController < ApplicationController

  def index
    @apps = App.all.includes(:clients)
  end

end
