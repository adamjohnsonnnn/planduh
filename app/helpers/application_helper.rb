module ApplicationHelper

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def redirect_unless_logged_in
      redirect_to new_session_path unless logged_in?
  end

  def redirect_unless_owner(user)
      redirect_to root_path unless current_user == user
  end

  def authorized?(user)
      current_user == user
  end

# TIME HELPERS (ITINERARIES)
  def slice_time_itinerary(time)
    time[0..1].to_i
  end

  def time_window(start_time, end_time)
    start_time = slice_time_itinerary(start_time)
    end_time = slice_time_itinerary(end_time)
    if start_time <= end_time
      time_window = end_time - start_time
      return time_window
    else
      adjusted_end_time = end_time + 24
      time_window = adjusted_end_time - start_time
      return time_window
    end
  end

  def user_input_to_unix(date, time)
    dt = create_datetime(date, time)
    DateTime.parse(dt).to_i
  end

  def create_datetime(date, time)
    date_time = date + " " + time
  end

end
