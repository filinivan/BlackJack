class Interface
  attr_accessor :deck, :bank

  def initialize
    @cards_suits = ['+', '<3', '^', '<>']
    @cards_values = { "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9,
                      "10": 10, "jack": 10, "queen": 10, "king": 10, "ace": 11 }
    @deck = {}
    @bank = 0
    @hide_status = false
  end

  def start
    input_name if @user.nil?
    new_game if @deck.empty?
  
    loop do
      status if @hide_status == false
      input = gets.chomp
      case input
      when 'open'
        winner
      when 'card'
        card
      when 'pass'
        pass
      else
        puts 'Неверное значение'
      end
    end
  end

  private

  def input_name
    puts 'Введите ваше имя: '
    @user = User.new(gets.chomp.capitalize)
    @diler = Diler.new ''
  end

  def winner
    @hide_status = true
    puts "Карты пользователя: #{@user.cards}. Карты дилера: #{@diler.cards} "
    if @user.calc_score < 22 && (@user.calc_score > @diler.calc_score)
      puts "Победил #{@user.name}"
      @user.money += @bank
      @bank = 0
    elsif @diler.calc_score < 22
      puts 'Победил дилер'
      @diler.money += @bank
      @bank = 0
    else
      puts 'Ничья!'
    end
    end_game
  end

  def card
    take_card(@user)
    if @diler.calc_score <= 17
      take_card(@diler)
    else
      puts 'Дилер пропустил ход.'
    end
    winner if (@user.cards.length == 3) && (@diler.cards.length == 3)
  end

  def pass
    if @diler.calc_score <= 17
      take_card(@diler)
    else
      puts 'Дилер пропустил ход.'
    end
  end

  def status
    puts "Банк: #{@bank}"
    puts "Пользователь - Очки: #{@user.calc_score}, карты: #{@user.cards}, баланс: #{@user.money}"
    puts "Дилер - карты: #{@diler.hide!}, баланс: #{@diler.money}"
    puts 'Показать карты - open, Взять карту - card, Пропуск хода - pass:'
  end

  def new_game
    @bank = 0
    new_deck
    give_cards
  end

  def give_cards
    2.times { take_card(@user, true); take_card(@diler, true) }
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

  def take_card(player, no_pay = false)
    if player.cards.length <= 2
      card = @deck.to_a.sample(1).to_h
      player.cards << card.keys[0].to_s
      player.score += card.values[0]
      @deck.delete(card.keys[0].to_s)
    else
      puts 'Максимальное количество карт'
    end
  end

  def new_deck
    @cards_suits.each do |img|
      @cards_values.each do |key, value|
        @deck["#{key}#{img}"] = value
      end
    end
  end

  def clear 
    @user.cards = []
    @diler.cards = []
    @user.score = 0
    @diler.score = 0
  end

  def end_game
    puts 'Играем ещё? (y/n)'
    answer = gets.chomp
    if answer == 'y'
      raise 'Закончились деньги' if @user.money.zero? || @diler.money.zero?
      @hide_status = false
      clear
      give_cards
      start
    elsif answer == 'n'
      exit
    end
  end
end
