require 'journeylog'

describe JourneyLog do
	it { should respond_to(:start).with(1).argument }
	it { should respond_to(:finish).with(1).argument }
	it { should respond_to(:journeys) }

	let(:journey) {double :journey, start_journey: true}

	it "touches in and out" do
		subject.start(:station)
		subject.finish(:other_station)
		expect(subject.journeys).to include({:EntryStation=>:station, :ExitStation=>:other_station})
	end

	it "doesn't touch in" do
		subject.finish(:station)
		expect(subject.journeys).to include({:EntryStation=>nil, :ExitStation=>:station})
	end

	it "doesn't touch out" do 
		subject.start(:station)
		subject.start(:station)
		expect(subject.journeys).to include({:EntryStation=>:station, :ExitStation=>nil})
	end 
end