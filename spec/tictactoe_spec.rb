require 'tictactoe.rb'

def game 
	@game ||= TicTacToeGame.new
end

describe TicTacToeGame do

	it "Initialize the game" do
		game.should be_instance_of TicTacToeGame
	end

	it "the board should be blank" do
		game.is_board_empty.should be(true)	
	end

	it "player move" do
		testBoard = ["X","O"," "," "," "," "," "," "," "]
		game.player_moves('X', 0)
		game.player_moves('O', 1)
		game.board.should eq(testBoard)
	end
	
	it "player moves in a taken position" do
		testBoard = ["X"," "," "," "," "," "," "," "," "]
		game.player_moves('X', 0)
		game.player_moves('O', 0)
		game.board.should eq(testBoard)
	end

	it "player wins in a row" do
		game.player_moves('X', 0)
		game.player_moves('X', 1)
		game.player_moves('X', 2)
		game.check_winner_rows('X').should be(true)
	end

	it "Row is full, no winner" do
		game.player_moves('X', 0)
		game.player_moves('O', 1)
		game.player_moves('X', 2)
		game.check_winner_rows('X').should be(false)	
	end

	it "player wins in a column" do
		game.player_moves('X', 2)
		game.player_moves('X', 5)
		game.player_moves('X', 8)
		game.check_winner_columns('X').should be(true)
	end

	it "Column is full, no winner" do
		game.player_moves('X', 0)
		game.player_moves('O', 3)
		game.player_moves('X', 6)
		game.check_winner_rows('X').should be(false)	
	end

	it "player wins in a diagonal" do
		game.player_moves('X', 0)
		game.player_moves('X', 4)
		game.player_moves('X', 8)
		game.check_winning_diagonal('X').should be(true)
	end

	it "diagonal full, no winners" do
		game.player_moves('X', 0)
		game.player_moves('O', 4)
		game.player_moves('X', 8)
		game.check_winning_diagonal('X').should be(false)
	end

	it "player wins in a anti_diagonal" do
		game.player_moves('X', 2)
		game.player_moves('X', 4)
		game.player_moves('X', 6)
		game.check_winning_anti_diagonal('X').should be(true)
	end

	it "anti diagonal full, no winners" do
		game.player_moves('X', 0)
		game.player_moves('O', 4)
		game.player_moves('X', 8)
		game.check_winning_diagonal('X').should be(false)
	end

end