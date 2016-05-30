require 'oystercard.rb'

describe Oystercard do
	it 'initializes Oystercard with default balance 0' do
		expect(Oystercard.new.balance).to eq 0
	end
end