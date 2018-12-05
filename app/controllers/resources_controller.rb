class ResourcesController < ApplicationController
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_back(fallback_location: root_path)
  end

  
end
