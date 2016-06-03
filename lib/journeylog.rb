require_relative 'journey'
class JourneyLog
	def initialize
		@journeys = Array.new
		@entry_station = nil
		@exit_station = nil
	end

	def start entry_station
		if @journey_class
			fare = @journey_class.fare

			write_journey
		end
		@journey_class = Journey.new
		@entry_station = entry_station
		@journey_class.start_journey(entry_station)
		fare ? fare : 0
	end

	def finish exit_station
		@journey_class = Journey.new if !@journey_class
		@exit_station = exit_station
		@journey_class.finish_journey(@exit_station)
		fare = @journey_class.fare
		write_journey
		fare
	end

	def journeys
		@journeys
	end

	def write_journey
		station_hash = Hash.new
		station_hash[:EntryStation] = @entry_station
		station_hash[:ExitStation] = @exit_station
		@entry_station = nil
		@exit_station = nil
		@journeys << station_hash
	end
end