require_relative 'game'
require_relative 'player'
require_relative 'dice'

# create players
p1 = Player.new('Player A')
p2 = Player.new('Player B')
p3 = Player.new('Player C')
p4 = Player.new('Player D')

# add dice to players
6.times { p1.add_dice Dice.new }
6.times { p2.add_dice Dice.new }
6.times { p3.add_dice Dice.new }
6.times { p4.add_dice Dice.new }

# add players to the game
game = Game.new
players = [p1, p2, p3, p4]

round = 1
while !game.is_ended?
  puts "======== Round #{round} ========"

  # roll dice
  players.each do |player|
    player.dices.each {|dice| dice.roll}
  end

  puts "After dice rolled"
  players.each {|player| puts "#{player.name}: #{player.last_rolls}"}
  puts ""

  # discard dices
  players.each {|player| player.discard_dices}

  # move dices
  p1.move_dices(p2)
  p2.move_dices(p3)
  p3.move_dices(p4)
  p4.move_dices(p1)

  # discard dices
  # must invoke again after moving dices
  players.each {|player| player.discard_dices}

  # add stolen dices
  players.each do |player|
    if !player.stolen_dices.empty?
      player.stolen_dices.each do |stolendice|
        player.add_dice(stolendice)
      end
      player.stolen_dices.clear
    end
  end

  puts "\s\sAfter dice moved/removed"
  puts "\s\s#{p1.name}: #{p1.dices.collect {|x| x.last_roll}.join(', ')}"
  puts "\s\s#{p2.name}: #{p2.dices.collect {|x| x.last_roll}.join(', ')}"
  puts "\s\s#{p3.name}: #{p3.dices.collect {|x| x.last_roll}.join(', ')}"
  puts "\s\s#{p4.name}: #{p4.dices.collect {|x| x.last_roll}.join(', ')}"

  puts ""

  players.each {|player| game.add_winner(player) if player.dices.count < 1}

  round += 1
end

puts "We have #{game.winners.count} winner(s):"
puts game.winners.collect {|player| player.name}
