require 'journey'

describe Journey do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { described_class.new(entry_station) }

  describe "#initialize" do

    context "when given entry_station at initialize" do

      it "has entry station on initialization" do
        expect(journey.entry_station).to eq entry_station
      end

    end

    context "when not given entry_station at initialize" do

      let(:journey) { described_class.new() }

      it "has entry station on initialization" do
        expect(journey.entry_station).to eq nil
      end

    end

  end

  describe "#finish" do

    it "has exit_station on finish" do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end

  end

  describe "#complete" do

    context "journey has begun" do

      it "journey is not complete" do
        expect(journey).not_to be_complete
      end

    end

    context "journey has finished" do

      it "journey is complete" do
        journey.finish(exit_station)
        expect(journey).to be_complete
      end

    end

  end

end
