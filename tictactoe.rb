require 'tic_tac_toe_constants'
require 'checker'
class Tic_Tac_Toe_Game
	attr_reader :board

	def initialize
		@board = [" "," "," "," "," "," "," "," "," "]
	end

	def checker 
		@checker ||= Checker.new
	end

	def board_empty?
		checker.board_empty?(@board)
	end

	def player_move(player_symbol, index)
		if(checker.cell_empty?(index,board))
			@board[index]=player_symbol
			return true
		else
			return false
		end
	end

end