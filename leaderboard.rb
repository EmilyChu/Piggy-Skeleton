require './db/setup'
require './lib/record'

class Leaderboard
  def initialize
  end

  def display
    puts "Leaderboard"
    # orders top scores. 
    scoreboard = Record.order(wins: :desc).first(5)
    # puts "Wins: #{scoreboard.wins}\tLosses: #{scoreboard.losses}\tTotal Games Played: #{scoreboard.total}"
    scoreboard.each do |line|
      puts "Wins: #{line.wins}\tLosses: #{line.losses}\tTotal Games Played: #{line.total}"
    end
  end
end

# runs a query where you select all records and print them out, or select all records 
# but limit them by x (5 for the top five or whatever) and order it by descending in terms of the wins column 
# (assuming there's a wins column somewhere) so you get the top five winners, and then print that out

