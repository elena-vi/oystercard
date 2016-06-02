require 'Oyster_card'
require 'Station'


describe "Feature test" do
	describe Oyster_card do
		it "can be created" do
			expect(Oyster_card).to respond_to(:new)
		end
		card = Oyster_card.new
		it "it can be topped up" do
			expect(card).to respond_to(:top_up)
		end
		it "it can be touched in" do
			expect(card).to respond_to(:touch_in)
		end
		it "it can be touched out" do
			expect(card).to respond_to(:touch_out)
		end
	end
end


# p card = Oyster_card.new(10)

# waterloo = Station.new(1, "waterloo")
# bank = Station.new(2, "bank")

# p "Card balance before :#{card.balance}"

# card.touch_in(waterloo)
# p "Card balance after first touch in: #{card.balance}"
# card.touch_in(waterloo)
# p "Card balance after second touch in (no change): #{card.balance}"

# card.touch_out(bank)

# p "Card balance after touch out (-1): #{card.balance}"
