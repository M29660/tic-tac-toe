require 'tic_tac_toe_constants'

class Checker

	def player_win?(player_symbol, board)
		check_winner_rows(player_symbol, board) ||
		check_winner_columns(player_symbol, board) ||
		winning_diagonal?(player_symbol, board) ||
		winning_anti_diagonal?(player_symbol, board)
	end

	def board_empty?(board)
		not( (board.include? T_Constants::X_MARK) || (board.include? T_Constants::O_MARK) )
	end

	def cell_empty?(index, board)
		board[index]== T_Constants::EMPTY_MARK
	end

private
	def check_winner_rows(player_symbol, board)
		winning_row = [player_symbol, player_symbol, player_symbol]
		(0..6).step(3) do |base_number|
	    	return true if winning_row == board.slice(base_number,3) 
		end
	return false	
	end

	def check_winner_columns(player_symbol, board)
		[0,1,2].each do |base_number|
				if winning_column = winning_column?(base_number, player_symbol, board)
				return true if winning_column
				end
		end
		return false
	end

	def winning_column?(base_number, player_symbol, board)
		(board[base_number] == player_symbol) && 
		(board[base_number+3] == player_symbol) && (board[base_number+6] == player_symbol) 
	end

	def winning_diagonal?(player_symbol, board)
		(board[0] == player_symbol) && (board[4] == player_symbol) && (board[8] == player_symbol)
	end

	def winning_anti_diagonal?(player_symbol, board)
		(board[2] == player_symbol) && (board[4] == player_symbol) && (board[6] == player_symbol)
	end

#	private
#	def winning?(*positions)
#		positions.each { |position| board[position] == player_symbol }
#	end	

end