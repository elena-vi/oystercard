class Oystercard

	attr_reader :balance, :entry_station
	LIMIT = 90
	MIN = 1

	def initialize
		@balance = 0
		@entry_station = nil
	end

	def top_up(amount)
		fail "Error: cannot have balance greater than £#{LIMIT}" if @balance+amount > LIMIT
		@balance += amount
		self
	end


	def touch_in(station)
		fail "Error: please top up" if @balance < MIN
		@entry_station = station
	end

	def touch_out
		deduct(MIN)
		@entry_station = nil
	end

	def in_journey?
		@entry_station ? true : false
	end

	private
	
	def deduct(fare)
		@balance -= fare
	end
end