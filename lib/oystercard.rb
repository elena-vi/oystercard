require_relative 'journeylog'
class Oystercard

  attr_reader :balance, :journeys, :current_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
    @current_journey = JourneyLog.new
  end

  def top_up(money)
    fail "balance cannot exceed #{MAXIMUM_BALANCE}" if exceed(money)
    @balance += money
  end

  def touch_in(station)
    fail 'Balance too low to enter' if low_balance
    deduct(@current_journey.start(station))
  end

  def touch_out(station)
    deduct(@current_journey.finish(station))
  end

  # def in_journey?
  #   !@current_journey.empty?
  # end

  private

  def exceed(money)
    money + balance > MAXIMUM_BALANCE
  end

  def low_balance
    balance < MINIMUM_FARE
  end

  def deduct(fare)
    @balance -= fare
  end

end
