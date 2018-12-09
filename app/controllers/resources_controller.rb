class ResourcesController < ApplicationController
  before_action :set_resource, only: [:edit, :update, :destroy]

  def destroy
    @resource.destroy
    flash[:success]="resource was successfully destroyed"
    redirect_back(fallback_location: root_path)
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      flash[:success]="resource was successfully created"
      redirect_back(fallback_location: root_path)
      return
    else
      flash[:danger]= @resource.errors
      redirect_back(fallback_location: root_path)
      return
    end
  end

  def show
    

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:name, :description, :resource_type, :establishment_id, :is_active)
    end
end
