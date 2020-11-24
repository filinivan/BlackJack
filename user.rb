class User
  def initialize(name)
    @score = 0
    @cards = []
    @money = 100
    @name = name
  end

  attr_reader :name
  attr_accessor :cards, :score, :money

end
