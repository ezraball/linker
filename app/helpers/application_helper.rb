module ApplicationHelper
  def glyphicon(icon, text = "")
    "<span class=\"glyphicon glyphicon-#{icon}\">#{text}</span>".html_safe
  end
end
