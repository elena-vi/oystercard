require 'Oyster_card.rb'

describe Oyster_card do
	subject(:card) {described_class.new()}

	let(:paddington) {double(:station)}
	let(:liverpool_st) {double(:station)}
	# let(:)
	it "new card balance should be 0" do
		expect(card.balance).to eq 0
	end

	it "can top up" do
		expect {card.top_up(1)}.to change{card.balance}.by(1)
	end

	it "Can't top up more than 90" do
		expect{ card.top_up(1+Oyster_card::MAXIMUM) }.to raise_error "Cannot top up more than £90."

	end

	it "Can charge on touch out" do
		expect {card.touch_out(paddington)}.to change{card.balance}.by(-Journey::PENALTY)
	end

	it "Can't touch in" do
		expect{ card.touch_in(paddington) }.to raise_error "Insufficient funds"
	end

	# context "Card has money" do
	# 	before(:each) do
	# 		card.top_up(5)
	# 	end

	# 	it "Can touch in" do
	# 		card.touch_in(liverpool_st)
	# 		expect( card.deduct).to receive(:start).with(liverpool_st)
	# 	end
	# end
end

# describe Oyster_card do
# 	it "can be created" do
# 		expect(Oyster_card).to respond_to(:new)
# 	end
# 	card = Oyster_card.new
# 	it "it can be topped up" do
# 		expect(card).to respond_to(:top_up)
# 	end
# 	it "it can be touched in" do
# 		expect(card).to respond_to(:touch_in)
# 	end
# 	it "it can be touched out" do
# 		expect(card).to respond_to(:touch_out)
# 	end
# end