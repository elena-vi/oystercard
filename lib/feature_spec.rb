require '../lib/oystercard.rb'

# canary_Warf = Station.new

oc = Oystercard.new
p oc.balance

p oc.top_up(10)
p "---"
p oc.balance

p oc.touch_in("potato")
p oc.in_journey?
p oc.touch_out
p oc.in_journey?
