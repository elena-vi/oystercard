class Oystercard

	attr_reader :balance
	LIMIT = 90
	MIN = 1

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up(amount)
		fail "Error: cannot have balance greater than £#{LIMIT}" if @balance+amount > LIMIT
		@balance += amount
		self
	end


	def touch_in
		fail "Error: please top up" if @balance < MIN
		@in_journey = true
	end

	def touch_out
		deduct(MIN)
		@in_journey = false
	end

	def in_journey?
		@in_journey
	end
	private
	def deduct(fare)
		@balance -= fare
	end
end