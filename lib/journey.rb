class Journey

  attr_reader :entry_station, :exit_station, :complete

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  # def initialize
  #   @complete = false
  # end

  def start_journey(station=nil)
    @entry_station = station
  end

  def finish_journey(exit_station=nil)
    @exit_station = exit_station
    p fare
  end

  # def complete?
  #   complete
  # end

  def fare
    return PENALTY_FARE if penalty?
    return MINIMUM_FARE
  end

  private

  def penalty?
    (!exit_station || !entry_station)
  end

end
