module Interface
  module_function

  def ask_name
    puts 'Введите имя пользователя: '
    gets.chomp.capitalize
  end

  def status(bank, user, diler)
    puts "Банк: #{bank}"
    puts "Пользователь - Очки: #{user.calc_score}, карты: #{user.cards}, баланс: #{user.money}"
    puts "Дилер - карты: #{diler.hide!}, баланс: #{diler.money}"
  end

  def ask_decision
    puts 'Показать карты - open, Взять карту - card, Пропуск хода - pass:'
    input = gets.chomp
  end

  def cards(user, diler)
    puts "Карты пользователя: #{user}. Карты дилера: #{diler} "
  end

  def winner(name = 'ничья')
    puts "Победитель: #{name}"
  end

  def diler_pass
    puts 'Дилер пропустил ход.' 
  end

  def max
    puts 'Максимальное количество карт'
  end

  def again?
    puts 'Играем ещё? (y/n)'
    answer = gets.chomp
  end

  def no_money
    puts 'Дальнейшая игра невозможна по финансовым причинам)'
  end 
end
