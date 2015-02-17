require 'pry'
require './db/setup'
require './lib/borrowed_pig'
require './lib/record'
require './leaderboard'

puts "Do you want to see the Leaderboard? (y/n)"
answer = gets.chomp.downcase
  if answer == "y"
    d = Leaderboard.new
    d.display
  else 
  end

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

scoreboard = Record.where(name: g.winner.name)
scoreboard.each {|x| puts "#{g.winner.name}, your record is now: #{x.wins} wins and #{x.losses} losses"}

# scoreboard = Memory.first_or_create!(name: name)


