module ApplicationHelper
  def nav_li text, path
    active = request.path == path ? :active : nil
    content_tag :li, link_to(text, path), class: active
  end
end
