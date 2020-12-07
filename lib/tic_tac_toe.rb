#require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, player_token)
        @board[index] = player_token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if index >= 0 && index < 9 && @board[index] == " "
            true 
        else
            false
        end
    end

    def turn_count
        @board.count {|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Pick a position 1-9"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            player_token = current_player
            move(index, player_token)
           display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each {|win_combo|
          index_0 = win_combo[0]
          index_1 = win_combo[1]
          index_2 = win_combo[2]
      
          position_1 = @board[index_0]
          position_2 = @board[index_1]
          position_3 = @board[index_2]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
          else
            false
          end
        }
        false
    end

    def full?
        @board.all? {|i| i == "X" || i == "O"}
    end

    def draw?
        if !won? && full?
            true
        else
            false
        end
    end

    def over?
        if won? || draw? 
            true
        else
            false
        end
    end

    def winner
        index = []
        index = won?
        if index == false
            return nil
        else
            if @board[index[0]] == "X"
                "X"
            else
                "O"
            end
        end
    end

    def play 
        until over? == true
            turn
        end

        if won?
            puts "Congratulations #{self.winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
        

#binding.pry
end
