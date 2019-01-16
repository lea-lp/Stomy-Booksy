class ServicesController < ApplicationController

  def index
    if params[:establishment_id]
      @establishment = Establishment.find(params[:establishment_id])
      @services = @establishment.services
    elsif params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @services = @teacher.services
    else

      @services = if params[:term]
        Service.where('name LIKE ?', "%#{:term}%")
      else
        Service.all
      end

    end
    @establishments = Establishment.all
    @teachers = Teacher.all
  end





  def show
  end

  def create
    params[:service][:duration] = params[:service][:duration_minutes].to_i*60
    @service = Service.new(service_params)

    if @service.save
      flash[:success]="Le service a bien été créé!"
      redirect_back(fallback_location: root_path)
      return
    else
      flash[:danger]= @service.errors
      redirect_back(fallback_location: root_path)
      return
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:success]="Le service a bien été détruit!"
    redirect_back(fallback_location: root_path)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service).permit(:name, :description, :duration, :establishment_id, :teacher_id, :resource_id, :sub_category_id, :term)
  end

end
