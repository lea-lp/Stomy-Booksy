class EventsController < ApplicationController
  before_action :filter_on_signed_in

  def index
    #to build the "new event" form
    @hours = []
    (8..20).to_a.each do |i| 
      @hours << [i.to_s,i.to_s]
    end
    @minutes = [["00", "00"], ["15", "15"], ["30", "30"], ["45", "45"]]

    #all the objects used in the view
    @service = Service.find(params[:service_id])
    @teacher = @service.teacher
    @resource = @service.resource
    @establishment = @service.establishment
    @student = current_student
    @event = Event.new

    #all the events to show
    @events_resource= @resource.upcoming_events
    @events_teacher= @teacher.upcoming_events
    @events = []
    @events.concat(@events_resource) 
    @events.concat(@events_teacher) 
    @events.uniq!
  end

  def show
    @event = Event.find(params[:id])
    page_belongs_to_user?(@event)

    @service = @event.service
    @resource = @event.resource
    @teacher = @event.teacher
    @establishment = @event.resource.establishment
    @duration = Time.at(@event.duration).utc.strftime("%Hh%M")


  end

  def edit
  end

  def create
    params[:event][:start_time] = params[:event][:date]+"T"+params[:event][:hours]+":"+params[:event][:minutes]

    @event = Event.new(event_params)
    @event.set_event_name

    if @event.save
      flash[:success]="Le créneau a bien été réservé!"
      redirect_back(fallback_location: root_path)
      return
    else
      flash[:danger]= @event.errors
      redirect_back(fallback_location: root_path)
      return
    end
  end

  def destroy
    @event = Event.find(params[:id])
    page_belongs_to_user?(@event)

    @event.destroy
    flash[:success]="Votre rendez-vous a été supprimé"
    redirect_to(get_dashboard(current_student))

  end 

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :student_id, :service_id)
  end

end
