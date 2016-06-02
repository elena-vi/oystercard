class Journey

  attr_reader :entry_station, :exit_station, :complete

  def initialize(station=nil)
    @entry_station = station
    @complete = false
  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
  end

  def complete?
    complete
  end

end
