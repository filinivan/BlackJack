class Gamer
  attr_accessor :cards, :score, :money, :name

  def initialize(name)
    @score = 0
    @cards = []
    @money = 100
    @name = name
  end

  def calc_score
    if @cards.any? { |card| card =~ /ace/ }
      @score -= 10 if @score > 21
    end
    @score
  end

  def pay_to_bank
    if @money - 10 <= 0
      raise 'Недостаточно средств'
    else @money -= 10
    end
  end
end
