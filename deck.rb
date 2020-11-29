module Deck
  @cards_suits = ['+', '<3', '^', '<>']
  @cards_values = { "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9,
                      "10": 10, "jack": 10, "queen": 10, "king": 10, "ace": 11 }
  @deck = {}                    
  
  module_function

  def generate
    @cards_suits.each do |img|
      @cards_values.each do |key, value|
        @deck["#{key}#{img}"] = value
      end
    end
    return @deck
  end
end
