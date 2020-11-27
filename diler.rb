class Diler < Gamer
  def hide!
    @cards.map { |_item| _item = '*' }
  end
end
