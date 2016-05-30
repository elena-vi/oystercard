class Oystercard

	attr_reader :balance
  LIMIT = 90

	def initialize
		@balance = 0
	end

	def top_up(amount)
    fail "Error: cannot have balance greater than £#{LIMIT}" if @balance+amount > LIMIT
		@balance += amount
		self
	end

	def deduct(fare)
		@balance -= fare
	end

end