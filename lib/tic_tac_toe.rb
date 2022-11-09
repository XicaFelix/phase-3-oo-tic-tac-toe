
class TicTacToe
    attr_reader :board
    attr_accessor :index, :move, :token, :turn_count, :current_player, :x_s, :o_s
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        @turn_count = 0
    end

    def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index input
        index = input.to_i - 1
    end

    def position_taken? index
        @board[index] != " "
    end

    def valid_move? position
    position.between?(0,8) && !position_taken?(position) ? true : false
    end

    def turn_count
        @turn_count = @board.count("O") + @board.count("X")
    end

    def move(index, token= "X")
        @board[index] = token
    end

    def current_player
        self.turn_count.even? ? "X" : "O"
    end

    def turn
        puts 'Please enter a position between 1 and 9'
        position = gets.strip
        position = input_to_index(position)
       if self.valid_move?(position)
            self.move(position, current_player)
            self.display_board
       else
        self.turn
       end
    end

    def won?
        WIN_COMBINATIONS.any? do |item|
            if position_taken?(item[0]) && @board[item[1]] == @board[item[2]] && @board[item[0]] == @board[item[1]]
                return item
            end
        end
    end

    def full?
        !@board.include?(' ')
     end

     def draw?
         if full? 
            won? ? false : true
        else
            false
        end
     end

     def over?
        full? | draw? ? true : false
     end

     def winner
        if won?
            win_combo = won?
            @board[win_combo[0]]
        else
            nil
        end
     end

     def play
       while over? == false
            turn
       end
       if winner
            puts "Congrats #{winner}"
       else
            puts "Game is a draw"
       end
    end

end

