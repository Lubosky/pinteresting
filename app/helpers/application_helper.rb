module ApplicationHelper
	
	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "Pinteresting"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	# Defines different flash messages.
	def bootstrap_class_for(flash_type)
		case flash_type
			when "success"
				"alert-success"   # Green message
			when "error"
				"alert-danger"    # Red message
			when "alert"
				"alert-warning"   # Yellow message
			when "notice"
				"alert-info"      # Blue message
			else
				flash_type.to_s
		end
	end

	# Returns flash messages in the application.
	def flash_messages(opts = {})
		flash.each do |msg_type, message|
			concat(content_tag(:div, message, class: "container alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
				concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
					concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
					concat content_tag(:span, 'Close', class: 'sr-only')
				end)
				concat message
			end)
		end
		nil
	end
	
end