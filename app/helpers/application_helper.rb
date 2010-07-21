module ApplicationHelper
  
  def listitem(text,link)
    x = "<li>"
    x += link_to_unless_current( text, link) { "<span class='current'>#{text}</span>"}
    x+="</li>"
    x.html_safe
  end
  
end
