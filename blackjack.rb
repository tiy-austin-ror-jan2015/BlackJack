class Blackjack
	def initialize
		@player = Player.new
		@deck = Deck.new
		@total = 100
		@hand = Player.new
	end

	def play
		
		puts "Your cash total is #{@total}!"

		@dealer_hand = Deck.draw  #NoMethodError: undefined method `draw' for Blackjack::Deck:Class *sad face* -JH
		@hand = Deck.draw         #You are calling draw on the Deck class itself and not on an instance of the deck class
		                          #Remember that classes are like factories. You probably meant @deck.draw -JH
		puts "You have the cards #{hand}"
		@total -= 10

		puts "Your cash total is #{@total}!"


		if hand == 21
			puts "Congrats you won this hand!"
			@total += 20
			player.play
		else
			puts choice
		
		end
	end

#add quit function

	def choice
		while hand > 21
			puts "You have the cards #{hand}"
			puts "Would you like to hit, or stand"
			player_choice = gets.chomp
		
		if player_choice == "hit"
				Deck.hit

				if hand > 21
					puts choice
					
				else
					puts "You busted you lost this round"
					Blackjack.play
				end

		else player_choice == "stand"
				if hand < dealer_hand
					puts "You have won this hand!"
					@total += 20
					Blackjack.play
				elsif hand > dealer_hand
					puts "You have lost this hand!"
					Blackjack.play
				else hand == dealer_hand
					puts "You have tied, no one wins!"
					Blackjack.play
				end
			end		
		end
	#You're missing and end here, because of that, the rest of the file is *inside* the Blackjack class.
	#That is why you are getting a no method error for Deck.draw
end

class Player
	attr_accessor :hand 
	def initialize
		@hand = []
	end
end

class Deck
	attr_accessor :draw , :hit, :shuffle, :cards
	def initialize
		@cards = []
		ace_cards = ([11] * 4)
		reg_cards = ([2..9] * 4)
		face_cards = ([10] * 16)
		#I like the way you generated the deck cards - JH

		ace_cards << cards
		reg_cards << cards
		face_cards << cards
                #This is backwards. I think you meant to put the deck cards into the cards array. - JH
	end

	def total_cards
		@cards.count
	end

	def shuffle
		@cards.shuffle
	end

	def draw
		@cards.shift(2)
	end

	def hit
		@cards.shift
	end
end
end
puts "Welcome to the great game of Blackjack!"
puts "Let's get started!"

game_start = Blackjack.new
game_start.play
