# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gprails::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html, instance|
  if html =~ /<(input|textarea|select)/
    ##{instance.method_name.to_s}
    " #{html} <small class=\"error\">#{[instance.error_message].flatten.first}</small>".html_safe
  elsif html =~ /<(label)/
    " #{html}".html_safe
  end
end

Time::DATE_FORMATS[:default] = "%d/%m/%Y"
Date::DATE_FORMATS[:default] = "%d/%m/%Y"
