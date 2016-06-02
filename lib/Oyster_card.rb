require_relative 'journeylog'

class Oyster_card

	attr_reader :balance, :journey_log
	MAXIMUM = 90
	MINIMUM = 1

	def initialize balance = 0
		@balance = balance
		@journey_log = JourneyLog.new
	end

	def top_up value
		fail "Cannot top up more than £90." if can_top_up?(value)
		@balance += value
	end

	def touch_in entry_station
		fail "Insufficient funds" if can_travel?
		deduct(@journey_log.start(entry_station))
	end

	def touch_out exit_station
		deduct(@journey_log.finish(exit_station))
	end

	private

	def can_top_up? value
		value > MAXIMUM
	end 

	def can_travel?
		@balance < MINIMUM
	end 

	def deduct value
		@balance -= value
	end

end
