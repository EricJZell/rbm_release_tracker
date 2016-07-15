class ReleasesController < ApplicationController

  def show
    @app = App.find(params[:app_id])
    @release = @app.releases.find(params[:id])
  end

  def new
    @app = App.find(params[:app_id])
    @release = @app.releases.new
  end

  def create
    @app = App.find(params[:app_id])
    all_params = release_params
    client_ids = all_params.delete("client_ids")
    @release = Release.new(all_params)
    @release.app = @app
    if @release.save
      client_ids.pop
      client_ids.each do |client_id|
        @release.release_clients.create(client_id: client_id)
      end
      redirect_to app_release_path(@app, @release), notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  private

  def release_params
    params.require(:release).permit(:branch_name, :app_id, :tag_name, client_ids: [])
  end

end
