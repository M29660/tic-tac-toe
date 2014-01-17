class TicTacToeGame 

def initialize
	@board = [" "," "," "," "," "," "," "," "," "]
end

def is_board_empty
	@board.each do |value|
		if(value != " ")
			return false
		end
		return true
	end
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
#	check_winner_rows(player_symbol)
#	check_winner_columns(player_symbol)
end

def check_winner_rows(player_symbol)
		winning_row = [player_symbol, player_symbol, player_symbol]
		winning_row == board.slice(0,3)|| 
		winning_row == board.slice(3,3)|| 
		winning_row == board.slice(6,3)
end

#Two arrays are equal if they contain the same number of elements and if each 
#element is equal to (according to Object.==) the corresponding element in the other array.

def check_winner_columns(player_symbol)
		base_number = 0
		column1     = [board[base_number], board[base_number+3], board[base_number+6]]

		winning_column = [player_symbol, player_symbol, player_symbol] 
		winning_column == column1 

		base_number = 1
		column2     = [board[base_number], board[base_number+3], board[base_number+6]]

		winning_column = [player_symbol, player_symbol, player_symbol] 
		winning_column == column2

		base_number = 2
		column3     = [board[base_number], board[base_number+3], board[base_number+6]]

		winning_column = [player_symbol, player_symbol, player_symbol] 
		winning_column == column3	
end
# array.map { |item| block }
#Invokes block once for each element of self. Creates a new array containing the values 
#returned by the block.

def check_winning_diagonal(player_symbol)
		winning_diagonal = [player_symbol]
		winning_diagonal == board.slice(0,1) &&
		winning_diagonal == board.slice(4,1) &&
		winning_diagonal == board.slice(8,1)
end

def check_winning_anti_diagonal(player_symbol)
		winning_diagonal = [player_symbol]
		winning_diagonal == board.slice(2,1) &&
		winning_diagonal == board.slice(4,1) &&
		winning_diagonal == board.slice(6,1)
end


def board
	@board
end

end