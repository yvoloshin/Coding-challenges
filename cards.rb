class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		@rank=rank
		@suit=suit
	end

	def output_card
		puts "#{@rank} of #{@suit}"
	end

	def self.random_card
		Card.new(rand(10), :spades)
	end
end

class Deck
  def initialize
    @cards=[]

    @cards<<Card.new(2, :spades)
    @cards<<Card.new(3, :spades)
    @cards<<Card.new(4, :spades)
    @cards<<Card.new(5, :spades)
    @cards<<Card.new(6, :spades)
    @cards<<Card.new(7, :spades)
    @cards<<Card.new(8, :spades)
    @cards<<Card.new(9, :spades)
    @cards<<Card.new(10, :spades)
    @cards<<Card.new(:Jack, :spades)
    @cards<<Card.new(:Queen, :spades)
    @cards<<Card.new(:King, :spades)
    @cards<<Card.new(:Ace, :spades)
       
  end
  
  def shuffle
    @cards.shuffle!
  end
  
  def output
    @cards.each do |card|
      card.output_card
    end
  end
    
  def deal
    @cards.shift.output_card  
  end
  
end

    
deck=Deck.new
deck.shuffle
puts("The shuffled deck is:")
deck.output
puts("First card is:")
deck.deal