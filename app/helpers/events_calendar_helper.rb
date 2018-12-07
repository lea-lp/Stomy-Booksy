module EventsCalendarHelper
  def add_weekly_calendar(events)
    render partial: "simple_calendar/weekly_calendar_events", locals: { events: events }
  end
  
  def event_position(event)
    "top: #{ ( ( (event.start_time - event.start_time.midnight)/3600 - 8 ) * 40 ) + 28}px;"
  end
  
  def event_height(event)
    "height: #{event.duration * 40/3600}px;"
  end
  
  # def at_location(appointment)
  #   " at #{appointment.location_name}" if appointment.location
  # end
  
  #Mets en valeur l'event (rajout de la classe highlight) si on est sur la page de show ou edit. A voir si on utilise...
  # def highlight_event(event)
  #   if current_page?( event_path(event)) || current_page?( edit_event_path(event) )
  #     " highlight"
  #   end
  # end
  
  # def from_to(appointment)
  #   "#{appointment.start_time.strftime("%l:%M %p")} - #{appointment.end_time.strftime("%l:%M %p")}"
  # end
  
  # def date_of_next(day, start_date)
  #   date = Date.parse(day)
  #   delta = date >= start_date ? 0 : 7
  #   date + delta
  # end
  
  # def date_of_last(day)
  #   date_of_next(day) - 7.days
  # end
end
