require_relative 'interface'
require_relative 'deck'

class Game
  attr_accessor :deck, :bank

  def initialize 
    @deck = Deck.generate
    @bank = 0
    @hide_status = false
    # @user_name = Interface.ask_name
    @new_round = true
  end

  def start
    input_name if @user.nil?
    new_game if @new_round == true
    loop do
      Interface.status(@bank, @user, @diler) if @hide_status == false
      input = Interface.ask_decision
      case input
      when 'open'
        winner
      when 'card'
        card
      when 'pass'
        pass
      end
    end
  end

  private

  def input_name
    @user = User.new(Interface.ask_name)
    @diler = Diler.new 'Дилер'
  end

  def winner
    @hide_status = true
    Interface.cards(@user.cards, @diler.cards)
    if @user.calc_score < 22 && (@user.calc_score > @diler.calc_score)
      Interface.winner(@user.name)
      @user.money += @bank
      @bank = 0
    elsif @diler.calc_score < 22 && (@user.calc_score < @diler.calc_score)
      Interface.winner(@diler.name)
      @diler.money += @bank
      @bank = 0
    else
      Interface.winner
    end
    end_game
  end

  def card
    take_card(@user)
    if @diler.calc_score <= 17
      take_card(@diler)
    else
      Interface.diler_pass
    end
    winner if (@user.cards.length == 3) && (@diler.cards.length == 3)
  end

  def pass
    if @diler.calc_score <= 17
      take_card(@diler)
    end
  end

  def new_game
    @deck = Deck.generate
    give_cards
    @new_round = false
  end

  def give_cards
    2.times do
      take_card(@user)
      take_card(@diler)
    end
    pay_to_bank(@user)
    pay_to_bank(@diler)
  end

  def pay
    pay_to_bank(@user)
    pay_to_bank(@diler)
  end

  def pay_to_bank(player)
    player.pay_to_bank
    @bank += 10
  end

  def take_card(player)
    if player.cards.length <= 2
      card = @deck.to_a.sample(1).to_h
      player.cards << card.keys[0].to_s
      player.score += card.values[0]
      @deck.delete(card.keys[0].to_s)
    else
      Interface.max
    end
  end

  def clear
    @user.cards = []
    @diler.cards = []
    @user.score = 0
    @diler.score = 0
  end

  def end_game
    answer = Interface.again?
    
    if answer == 'y'
      Interface.no_money if @user.money.zero? || @diler.money.zero?
      @hide_status = false
      clear
      give_cards
      start
    elsif answer == 'n'
      exit
    end
  end
end
