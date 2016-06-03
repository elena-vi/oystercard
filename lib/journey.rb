class Journey

  attr_reader :entry_station, :exit_station, :complete

  PENALTY_FARE = 6

  def initialize(station=nil)
    @entry_station = station
    @complete = false
  end

  def finish(exit_station=nil)
    @exit_station = exit_station
    @complete = true
  end

  def complete?
    complete
  end

  def fare
    return PENALTY_FARE if penalty?
  end

  private

  def penalty?
    (!exit_station || !entry_station)
  end

end
