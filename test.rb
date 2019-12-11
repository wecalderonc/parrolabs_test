module Game
  def self.start

    initial_array = [9, 10, "J", "Q", "K", "cat", "dog", "monkey", "bird", "A"]
    position_array = [0,3,6,9,12,1,4,7,10,13,2,5,8,11,14]
    board = []
    bet = 100

    def self.generate_board(board, initial_array)
      15.times {
        board.push(initial_array[rand(15)])
      }
      board
    end

    self.generate_board(board, initial_array)
    p "BOARD"
    p first_line_array = board[0..4]
    p second_line_array = board[5..9]
    p third_line_array = board[10..14]

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

    fourth_line_array = self.extracting_first_crossline(board, position_array)
    fifth_line_array = self.extracting_second_crossline(board, position_array)
    lines_array = [first_line_array, second_line_array, third_line_array, fourth_line_array, fifth_line_array]

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

    paylines = self.generating_paylines(lines_array)

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


    def self.printing_results(initial_array, bet, paylines)
      p "***************************************"
      p "RESULTS"
      {
        board: initial_array,
        paylines: paylines,
        bet_amount: bet,
        total_win: self.calculating_total_win(paylines, bet)
      }
    end
    pp printing_results(initial_array, bet, paylines)
    p "***************************************"
  end
end

Game.start
