class User < Gamer
  def take_card
    card = @deck.keys.sample
    @user.cards << card
    @deck.delete(card)
    puts @user.cards
  end
end
