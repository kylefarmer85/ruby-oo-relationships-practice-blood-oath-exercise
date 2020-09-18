require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



cult1 = Cult.new("cult1", "hell", 666, "got blood")
cult2 = Cult.new("cult2", "chicago", 777, "got milk")

follower1 = Follower.new("follower1", 69, "life sux")
follower2 = Follower.new("follower2", 55, "lifes good")
follower3 = Follower.new("follower3", 2, "hello world")
follower4 = Follower.new("follower4", 33, "obey your thirst")

cult1.recruit_follower(follower1)
cult1.recruit_follower(follower2)

cult2.recruit_follower(follower3)

Cult.find_by_name("cult1")
Cult.find_by_location("chicago")
Cult.find_by_founding_year(666)

follower4.cults
follower4.join_cult(cult2)
Follower.of_a_certain_age(2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits