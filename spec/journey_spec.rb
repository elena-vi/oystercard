require 'journey'

describe Journey do

	let(:station) {double :station}

	context 'given an entry station' do

		subject(:journey) {described_class.new(station)}

		it {is_expected.to respond_to(:complete?)}

		it 'knows if journey is not complete' do
			expect(journey).not_to be_complete
		end

		it 'has a penalty fare' do
			expect(journey.fare).to eq Journey::PENALTY
		end

		it 'returns journey on end' do
			expect(journey.end(station)).to eq journey
			expect(journey).to be_complete
		end

		it 'returns entry station' do
			expect(journey.entry_station).to eq station
		end

		it 'calculates fare' do
			journey.end(station)
			expect(journey.fare).to eq Journey::MIN
		end
	end
end