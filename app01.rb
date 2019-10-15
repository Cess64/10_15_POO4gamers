require 'bundler'   # lignes très pratiques qui appellent les gems du Gemfile.
Bundler.require

require_relative 'lib/game'  # lignes qui appellent les fichiers lib/user.rb et lib/event.rb
require_relative 'lib/player'


player1 = Player.new("José")
puts "En direct du tatami de Bagnolet, nous nous retrouvons pour notre hebdomadaire KUUUNG FUUU FIIIIIIGHTIIIIING !!!!!!"
puts "                                       A ma gauche #{player1.name}                                           "
player2 = Player.new("Cess64")
puts "                                   A mon ultra-gauche #{player2.name}"
puts "                                                                                                                  "
puts "=================================================================================================================="
puts "                                      Voici l'état des tiers joueurs "
puts "                                                                                                                  "
puts "                                  #{player1.show_state}, #{player2.show_state}"
puts "                                                                                                                  "
puts "=================================================================================================================="
puts "                  Let's go KUNG FU FIGHTIIIIIIIIIIIIIIIIING !  **://#*$ù==*://§;*ù''                              "
puts "                                                                                                                  "
puts "                *://#*$ù=          Everybody was kung-fu fighting!           *://#*$ù=                            "
puts "                                                                                                                  "
puts "                                                                                                                  "
puts "                                                                                                                  "

while player1.life_points >=0 && player2.life_points >= 0

     player1.attacks(player2)
     if player2.life_points <=0 then break end
     if player1.life_points <=0 then break end
     puts "                                                                                                              "
     player2.attacks(player1)
     puts "                                                                                                              "
    #player1.show_state
     puts "                                                                                                              "
     #player2.show_state
     puts "                                                                                                              "

end

binding.pry  # Maintenant c'est open bar !!