class ServicesController < ApplicationController
  def index
    if params[:establishment_id]
      @establishment = Establishment.find(params[:establishment_id])
      @services = @establishment.services
    elsif params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @services = @teacher.services
    else
      @services = Service.all
    end
  end

  def show
  end
end
