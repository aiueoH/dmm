module ApplicationHelper
  ALERT_TYPES = [:error, :info, :success, :warning] unless const_defined?(:ALERT_TYPES)
  
  # navbar active li
  def nav_li text, path
    active = request.path == path ? :active : nil
    content_tag :li, link_to(text, path), class: active
  end

  # alertify helper
  def alertify_notice
    jsReturn = javascript_tag()
    flash.each do |type, message|
      type = type.to_sym unless type.nil?
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      js_alertify = ""
      Array(message).each do |msg|
        js_alertify << "alertify.logPosition('bottom left'); alertify.#{type}('#{msg}');\n" if msg;
      end
      jsReturn = javascript_tag(js_alertify)
    end
    jsReturn.html_safe()
  end
  
  # inline input with label
  def dmm_input _f, _kind ,_label, _attr, _placeholder
    content_tag :div, class: "input-group" do
      (content_tag :span, _label, class: "input-group-addon") +
      if _kind == "text"
        (_f.text_field _attr, placeholder: _placeholder, class: "form-control text-center")
      elsif _kind == "number"
        (_f.number_field _attr, placeholder: _placeholder, class: "form-control text-center")
      else
        (_f.text_area _attr, placeholder: _placeholder, class: "form-control text-center")
      end
      
    end
  end
  
  # float add button
  def float_add_btn new_path
    link_to new_path, class: 'btn btn-embossed btn-primary btn-float' do
      content_tag :i, "", class: "glyphicon glyphicon-plus"
    end
  end
end
