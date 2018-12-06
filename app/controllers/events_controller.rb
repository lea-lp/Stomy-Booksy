class EventsController < ApplicationController

  def index
    @duration_picker = [["1h", 3600], ["30min", 1800]]
    @teacher = Teacher.find(params[:teacher_id])
    @resource = Resource.find(params[:resource_id])
    @establishment = @resource.establishment
    @resources = @establishment.resources
    @student = current_student
    @event = Event.new
  end

  def show
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.set_event_name

    if @event.save
      flash[:success]="event was successfully created"
      redirect_back(fallback_location: root_path)
      return
    else
      flash[:danger]= @event.errors
      redirect_back(fallback_location: root_path)
      return
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :duration, :teacher_id, :student_id, :resource_id)
  end

end
