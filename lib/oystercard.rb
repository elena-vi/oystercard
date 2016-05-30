class Oystercard

	attr_reader :balance, :entry_station, :journey_history
	LIMIT = 90
	MIN = 1

	def initialize
		@balance = 0
		@entry_station = nil
	  @journey_history = Array.new
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

	def touch_out(station)
		deduct(MIN)
    @journey_history << Hash[@entry_station, station]
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