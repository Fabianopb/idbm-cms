module ApplicationHelper
	
	def default_statuses
		['not submitted', 'sent for approval', 'requires revision', 'approved']
	end

	def status_color(status)
		case status
		when default_statuses[0]
		  'current-status-red'
		when default_statuses[1]
		  'current-status-yellow'
		when default_statuses[2]
		  'current-status-red'
		when default_statuses[3]
		  'current-status-green'
		end
	end

end