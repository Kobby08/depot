module ApplicationHelper
  def current_time
    time = Time.now
    time.strftime('%a %B, %Y %H:%M ')
  end
end
