class ReleasesController < ApplicationController

  def show
    app = App.find(params[:app_id])
    @release = app.releases.find(params[:id])
  end

end
