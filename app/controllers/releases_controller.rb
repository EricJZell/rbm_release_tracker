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
    singular_params = release_params
    client_ids = singular_params.delete("client_ids")
    client_ids.pop
    @release = Release.new(singular_params)
    @release.app = @app
    if @release.save && @release.update(clients: Client.find(client_ids))
      flash[:primary] = "New Release Created Successfully"
      redirect_to app_release_path(@app, @release)
    else
      flash[:alert] = @release.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @app = App.find(params[:app_id])
    @release = @app.releases.find(params[:id])
  end

  def update
    @app = App.find(params[:app_id])
    singular_params = release_params
    client_ids = singular_params.delete("client_ids")
    client_ids.pop
    @release = Release.find(params[:id])
    if @release.update(singular_params) && @release.update(clients: Client.find(client_ids))
      flash[:primary] = "Release Updated Successfully"
      redirect_to app_release_path(@app, @release)
    else
      flash[:alert] = @release.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy
    @app = App.find(params[:app_id])
    flash[:primary] = "Release Deleted Successfully"
    redirect_to app_path(@app)
  end

  def mark_as_released
    @release = Release.find(params[:id])
    @release.update_attribute(:release_date, Time.now)
    flash[:notice] = "#{@release.tag_name} has been marked as released"
    @app = App.find(params[:app_id])
    redirect_to app_path(@app)
  end

  private

  def release_params
    params.require(:release).permit(:description, :branch_name, :app_id, :tag_name, client_ids: [])
  end

end
