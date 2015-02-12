require 'pry'
require './db/setup'
require './lib/borrowed_pig'
require './lib/record'



g = Pig.new

puts "Let's play a game of Piggy."
g.get_players
g.players.each do |p|  
  n = p.name
  scoreboard = Record.where(name: n).first
  if scoreboard
    puts "Welcome back, #{n}"
    puts "Your history: #{scoreboard.total} games played, #{scoreboard.wins} wins, #{scoreboard.losses} losses (#{scoreboard.percentage}%)"
  else
    scoreboard = Record.create(name: n, wins: 0, losses: 0)
  end
end


until g.winner 
  g.play_round
end
  scoreboard = Record.where(name: g.winner.name)
  scoreboard.first.wins +=1
  scoreboard.first.save!

if g.winner  # why does this if have to be here?!?!?!
  g.losers.each do |x|
    scoreboard = Record.where(name: x.name)
    scoreboard.first.losses +=1
    scoreboard.first.save!
  end
end
puts "#{g.winner.name} wins!"
# puts "Your record is now: #{ph.total} games played, #{ph.wins} wins, #{ph.losses} losses (#{ph.percentage}%)"

# scoreboard = Memory.first_or_create!(name: name)
# emily = Record.new(name: name, wins: 0, losses: 0)

# if there is a winner.. add one to their wins tally