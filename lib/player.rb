require "pry"                    



class Player              # class méthodes et options correspondant aux joueurs "fictif"
	attr_accessor :name, :life_points

  def initialize(name)    # initialisation U!t avec le nom, tous les joueurs démarrent la partie avec 10 vies !
    @name = name
    @life_points = 10
  end

  def show_state          # méthode pour afficher le nombre de vies restantes du joueur
  	if self.life_points >= 5 then
  	puts "#{@name} a #{@life_points} points de vie !"  	
    else
    puts "#{@name} n'a plus que #{@life_points} points de vie..." 
    end	
  end

  def gets_damage(pts)    # méthode qui fait que le joueur perds des vies !

  	@pts = pts.to_i                                    # le nombre de vies perdues doit être un Integer
    @life_points = life_points - pts                   # soustraction des dommages

      #return self.show_state                          # pas necessaire visiblement dans cet exo ! mais renvoie le nombre de vies du joueur

      if @life_points <= 0 then puts "le joueur #{self.name} a été tué !" end  # phrase d'hommages aux morts !    	
  end

  def attacks(player)
  	
  	puts "le joueur #{self.name} contre-attaque (c'est pas un PD !) le joueur #{player.name}"   # self pour celui qui attaque, player pour celui qui est visé
  	@pts = compute_damage                                                                     # on lance les dés
  	#puts @pts                                                                                  vérif OK !
  	if @pts >= 4 then
  	
  	puts "#{self.name} inflige à #{player.name} la somme de #{@pts} points de vie de dommages et intérêts, quel FDP right ??!!" # il s'agit d'humour
  	player.gets_damage(@pts)                                                                  # on recalcule les points de vie du player attaqué
    else

  	puts "#{self.name} inflige à #{player.name} la somme de #{@pts} points de vie de dommages et intérêts...va falloir un peu mieux se chauffer #{self.name} !!"
    player.gets_damage(@pts)                                                                  # on recalcule les points de vie du player attaqué
  	end	
  	#return player.show_state, self.show_state                                            # on restitue les points de vie de chaque joueur, mais ils en veulent pas ici...JE RESPECTE LES CONSIGNES OK ????!!

  end

  def compute_damage

    return rand(1..6)                                                # tirage d'un chiffre aléatoire entre 1 et 6
  end


end 

class HumanPlayer < Player   # Alors il paraitrait que c'est sensé être dans un autre fichier...mais pour cette mission, ce sera là !
  attr_accessor :weapon_level, :name, :life_points
   

    def initialize(name)
    	super(name)                          #  fait appel à ttes les options de la classe parente...A.K.A. Player !!!
    	@weapon_level = 1
    	@life_points = 100
                           
    end 

    def show_state
    	puts "#{self.name} a #{self.life_points} points de vie et une arme de niveau #{self.weapon_level} !!"
    end

    def compute_damage
    	rand(1..6) * @weapon_level    	
    end

    def search_weapon 
    	new_weapon = rand(1..6)                                    # on conserve cette arme dans une nouvelle variable : new_weapon
    	puts "Tu as trouvé une arme de niveau #{new_weapon} !!"    # on le précise à l'intéréssé !
    	if new_weapon > @weapon_level then @weapon_level = new_weapon   # Si l'arme est meilleure que celle qu'il possède déjà, il change
    	  puts "Ouhouhhhh Hey Bilou, c'est encore mieux que ce que tu avais !! Allez, on garde !"
    	else @weapon_level == @weapon_level                               # Si non il conserve la précédente !
    	  puts "To bad my dear...Elle est encore plus pourrie que ce que tu as déjà...Cess64 t'envoie des coeurs d'encouragements :D !"
    	end
    	
    end

    def search_health_pack
    	health_pack = rand(1..6)
    	 if health_pack == 1 then puts "Nothing babe, try again...LATER !"
    	 elsif health_pack ==6 
    	 	  puts "No way babe !!!! Look how lucky U R !!! + 80 Pts de vie sans dommages ni interêts !"
    	 	  if self.life_points >= 20 then self.life_points = 100
              else self.life_points = self.life_points + 80 end
         else
              puts "No way babe !!!! t'as gagné 50 pts de vie et des coeurs d'encouragements !!!!"
    	 	  if self.life_points >= 50 then self.life_points = 100
              else self.life_points = self.life_points + 50 end
   	     end
    end

  def attacks(player)
  	
  	puts "le joueur #{self.name} contre-attaque le joueur #{player.name}"   # self pour celui qui attaque, player pour celui qui est visé
  	@pts = compute_damage                                                                     # on lance les dés

  	if @pts >= 4 then
  	
  	puts "#{self.name} inflige à #{player.name} la somme de #{@pts} points de vie de dommages et intérêts, MA QUE HOMBRE !!!!!" # il s'agit d'humour
  	player.gets_damage(@pts)                                                                  # on recalcule les points de vie du player attaqué
    else

  	puts "#{self.name} inflige à #{player.name} la somme de #{@pts} points de vie de dommages et intérêts...Plus fort #{self.name}, on compte sur toi !!"
    player.gets_damage(@pts)                                                                  # on recalcule les points de vie du player attaqué
  	end	
  	

  end

end