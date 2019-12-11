module Game
  def self.start(initial_array, position_array, bet, board)
    first_line_array = board[0..4]
    second_line_array = board[5..9]
    third_line_array = board[10..14]
    fourth_line_array = self.extracting_first_crossline(board, position_array)
    fifth_line_array = self.extracting_second_crossline(board, position_array)
    lines_array = [first_line_array, second_line_array, third_line_array, fourth_line_array, fifth_line_array]

    paylines = self.generating_paylines(lines_array)
    p "***************RESULTS*************"
    printing_results(board, bet, paylines)
  end

  def self.generate_board(initial_array)
    generated_board = []
    15.times {
      generated_board.push(initial_array[rand(initial_array.length)])
    }
    generated_board
  end

  def self.extracting_first_crossline(board, position_array)
    fourth_line_array = []
    new_array = [0,4,8,10,12]
    new_array.length.times { |x|
      fourth_line_array.push(board[position_array.index(new_array[x])])
    }
    fourth_line_array
  end

  def self.extracting_second_crossline(board, position_array)
    fifth_line_array = []
    new_array = [2,4,6,10,14]
    new_array.length.times { |x|
      fifth_line_array.push(board[position_array.index(new_array[x])])
    }
    fifth_line_array
  end


  def self.generating_paylines(lines_array)
    paylines = {}
    lines_array.each { |array|
      result = array.select{ |e| array.count(e) > 2 }

      if result.size > 2
        key = array
        paylines[key] = result.size
      end
    }
    paylines
  end

  def self.calculating_total_win(paylines, bet)
    total_win = 0
    paylines.values.each { |x|
      if x == 3
        total_win += bet*0.2
      elsif x == 4
        total_win += bet*2
      else
        total_win += bet*10
      end
    }
    total_win
  end

  def self.printing_results(board, bet, paylines)
    puts "board: #{board}"
    puts "paylines: #{paylines}"
    puts "bet_amount: #{bet}"
    puts "total_win: #{self.calculating_total_win(paylines, bet)}"
  end
end

initial_array = ["9", "10", "J", "Q", "K", "cat", "dog", "monkey", "bird", "A"]
position_array = [0,3,6,9,12,1,4,7,10,13,2,5,8,11,14]
bet = 100
board = Game.generate_board(initial_array)

Game.start(initial_array, position_array, bet, board)
