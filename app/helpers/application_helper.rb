module ApplicationHelper
  def current_time
    time = Time.now
    time.strftime('%a %B, %Y %H:%M ')
  end

  def render_if(condition, record)
    render record if condition
  end
end
