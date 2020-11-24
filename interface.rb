class Interface
  def initialize
    cards_suits = [ '+', '<3', '^', '<>']
    cards_values = { "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "jack": 10, "queen": 10, "king": 10, "ace": 11 }
    cards_gived = []
    money_bank = 0
    money_user = 100
    money_diler = 100
    @menu = %w[Начать_игру Взять_карту Пропустить_ход Закончить_игру Выход]
  end
  
  def start
    puts "Введите ваше имя: "
    user = User.new(gets.chomp.capitalize)
    diler = Diler.new

    loop do
      puts "Пользователь - Очки: #{user.score}, карты: #{user.cards}, баланс: #{user.money}"
      puts "Дилер - карты: #{diler.hide!}, баланс: #{diler.money}"
      puts "#{user.name}, выберите желаемое действие:"
      @menu.each.with_index(1) { |item, i| puts "#{i} - #{item}" }

      input = gets.to_i

      case input
      when 1
        start_game
      when 2
        take_card
      when 3
        skip
      when 4
        finish_game
      when 5
        break
      else
        puts 'Неверное значение!'
      end
    end
  end

  def seed
    #Посевные данные
  end 

  private

  def start_game
    #метод раздачи карт (по одной игроку и дилеру)
  end

  def take_card

  end  

  def skip

  end

  def finish_game

  end

  def new_card

  end

end
