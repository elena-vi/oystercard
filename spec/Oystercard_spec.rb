require 'oystercard.rb'

describe Oystercard do

	subject(:card) {described_class.new}

	it {is_expected.to respond_to(:in_journey?)}

	describe "#balance" do
		it {is_expected.to respond_to(:balance)}

		it 'initializes Oystercard with default balance 0' do
			expect(card.balance).to eq 0
		end
	end

	describe "#top_up" do
		it {is_expected.to respond_to(:top_up).with(1).argument }

		it 'tops up with £10' do
			expect{ card.top_up 10 }.to change{ card.balance }.by 10
		end

		it "has a £#{Oystercard::LIMIT} upper limit for balance" do
			max_balance = Oystercard::LIMIT
			expect{ card.top_up(max_balance+1) }.to raise_error "Error: cannot have balance greater than £#{max_balance}"
		end
	end

	describe "#deduct" do
		it {is_expected.to respond_to(:deduct).with(1).argument }

		it 'tops up with £10' do
			expect{ card.deduct 10 }.to change{ card.balance }.by -10
		end
	end

	describe "#touch_in" do
		it {is_expected.to respond_to(:touch_in)}
		it 'touch in and check status' do
			expect(card.touch_in).to eq true
			expect(card.in_journey?).to eq true
		end
	end
	describe "#touch_out" do
		it {is_expected.to respond_to(:touch_out)}
		it 'touch out and check status' do
			expect(card.touch_out).to eq false
			expect(card.in_journey?).to eq false
		end
	end
end
