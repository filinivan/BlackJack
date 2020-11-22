class Interface
  def initialize
    cards_suits = [ +, <, ^, <>]
    cards_values = {2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9, 10: 10, jack: 10, queen: 10, king: 10, ace: 11}
    money_bank = 0
    money_user = 100
    money_diler = 100
  end
  
  def start
    #цикличное меню
  end

  def seed
    #Посевные данные
  end 

  private

  def cards_deal
    #метод раздачи карт (по одной игроку и дилеру)
  end

  def cards_show
    #показать карты
  end

  def method_name
    
  end
end
