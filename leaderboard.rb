require './db/setup'
require './lib/record'

class Leaderboard
  def initialize
  end

  def display
    puts "\t\t*****LEADERBOARD*****\t\t"
    scoreboard = Record.order(wins: :desc).first(5)
    scoreboard.each do |x|
    puts "Player: #{x.name}\tWins: #{x.wins}\tLosses: #{x.losses}\tTotal Games Played: #{x.total}"
    end
  end
end

# d = Leaderboard.new
# d.display
