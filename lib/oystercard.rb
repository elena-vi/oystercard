class Oystercard

	attr_reader :balance
	LIMIT = 90

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up(amount)
		fail "Error: cannot have balance greater than £#{LIMIT}" if @balance+amount > LIMIT
		@balance += amount
		self
	end

	def deduct(fare)
		@balance -= fare
	end

	def touch_in
		@in_journey = true
	end

	def touch_out
		@in_journey = false
	end

	def in_journey?
		@in_journey
	end
end