require 'oystercard.rb'

describe Oystercard do

	subject(:card) {described_class.new}

	it {is_expected.to respond_to(:balance)}

	it {is_expected.to respond_to(:top_up).with(1).argument }

	it 'initializes Oystercard with default balance 0' do
		expect(subject.balance).to eq 0
	end

	it 'tops up with £10' do
		expect(subject.top_up(10).balance).to eq 10
	end
end