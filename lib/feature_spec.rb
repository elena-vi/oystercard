require '../lib/oystercard.rb'



oc = Oystercard.new
p oc.balance

p oc.top_up(10)
p "---"
p oc.balance
# p oc.top_up(90)

p oc.journey_history

stn = Station.new
stn.zone