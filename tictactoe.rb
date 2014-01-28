class TicTacToeGame 

def initialize
	@board = [" "," "," "," "," "," "," "," "," "]
end

def is_board_empty
	not( (@board.include? 'X') && (@board.include? 'O') )
end

def player_moves(player_symbol, index)
	if(is_cell_empty(index))
		@board[index]=player_symbol
	end
end

def is_cell_empty(index)
	@board[index]== " " 
end

def player_win(player_symbol)
	check_winner_rows(player_symbol)
	check_winner_columns(player_symbol)
end

def check_winner_rows(player_symbol)
	winning_row = [player_symbol, player_symbol, player_symbol]
	(0..6).step(3) do |base_number|
    	return true if winning_row == board.slice(base_number,3) 
	end
return false
end

def check_winner_columns(player_symbol)
for base_number in 0..2 
   		winning_column = is_winning_column(base_number, player_symbol)
	   return true if winning_column
end
return false
end

def is_winning_column(base_number, player_symbol)
	(@board[base_number] == player_symbol) && 
	(@board[base_number+3] == player_symbol) && (@board[base_number+6] == player_symbol) 
	end

def check_winning_diagonal(player_symbol)
	(@board[0] == player_symbol) && (@board[4] == player_symbol) && (@board[8] == player_symbol)
end

def check_winning_anti_diagonal(player_symbol)
	(@board[2] == player_symbol) && (@board[4] == player_symbol) && (@board[6] == player_symbol)
end	

def board
	@board
end

end