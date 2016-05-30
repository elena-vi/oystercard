class Journey

	MIN = 1
	PENALTY = 6

	attr_reader :entry_station

	def initialize station
		@entry_station = station
		@complete = false
	end

	def complete?
		@complete
	end

	def end station
		@exit_station = station
		@complete = true
		self
	end

	def fare
		return PENALTY unless @exit_station
		MIN
	end
end