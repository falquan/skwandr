class Incident < ActiveRecord::Base

	def minutes
		return duration / 60
	end

end
