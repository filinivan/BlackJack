class Diler
  def initialize
    @score = 0
    @cards = []
    @money = 100
  end

  attr_accessor :cards, :score, :money

  def hide!
    self.cards.map { |item| item = '*' }
  end
end
