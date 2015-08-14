class Incident < ActiveRecord::Base
	validates :duration, presence: true
end
