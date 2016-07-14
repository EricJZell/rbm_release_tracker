class ClientsController < ApplicationController

  def index
    @apps = App.all
  end

end
