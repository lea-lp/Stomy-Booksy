module EventsCalendarHelper
  def add_weekly_calendar(events, teacher, resource)
    render partial: "simple_calendar/weekly_calendar_events", locals: { events: events, teacher: teacher, resource: resource }
  end
  
  def event_position(event)
    "top: #{ ( ( (event.start_time - event.start_time.midnight)/3600 - 8 ) * 39.5 ) + 28}px;"
  end
  
  def event_height(event)
    "height: #{event.duration * 40/3600}px;"
  end
end
