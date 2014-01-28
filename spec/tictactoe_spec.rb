require 'tictactoe.rb'

def game 
	@game ||= TicTacToeGame.new
end

describe TicTacToeGame do

	context 'Initialize the game' do
  	
		it "The game start" do
			game.should be_instance_of TicTacToeGame
		end

		it "The board should be blank" do
  			expect(game.is_board_empty).to be_true
  		end
end	

	context 'player move' do

		it "player takes their move" do
		testBoard = ["X","O"," "," "," "," "," "," "," "]
		game.player_moves('X', 0)
		game.player_moves('O', 1)
		expect (game.board).should eq(testBoard)
	end
end

	context 'position taken' do

		it "player moves in a taken position" do
		testBoard = ["X"," "," "," "," "," "," "," "," "]
		game.player_moves('X', 0)
		game.player_moves('O', 0)
		expect (game.board).should eq(testBoard)
	
	end
end

	context 'when winning row' do

		it " shows a player with a winning row" do
		game.player_moves('X', 0)
		game.player_moves('O', 1)
		game.player_moves('X', 2)
		game.player_moves('X', 3)
		game.player_moves('X', 4)
		game.player_moves('X', 5)
		expect(game.check_winner_rows('X')).to be_true
	end
end

	context 'Row full there is no winner' do

		it "shows row is full, no winner" do
		game.player_moves('X', 0)
		game.player_moves('O', 1)
		game.player_moves('X', 2)
		expect(game.check_winner_rows('X')).to be_false	

	end
end

	context 'Column has winning column' do

		it "winning player column" do
		game.player_moves('X', 2)
		game.player_moves('X', 5)
		game.player_moves('X', 8)
		expect(game.check_winner_columns('X')).to be_true
	end
end

	context 'Column is full there is no winner' do

		it "Column is full, no winner" do
		game.player_moves('X', 0)
		game.player_moves('O', 3)
		game.player_moves('X', 6)
		expect(game.check_winner_rows('X')).to be_false	
	end
end

	context 'winning player diagonal line' do

		it "winning diagonal line" do
		game.player_moves('X', 0)
		game.player_moves('X', 4)
		game.player_moves('X', 8)
		expect(game.check_winning_diagonal('X')).to be_true
	end
end

	context 'no winners on a diagonal line' do

		it "diagonal full, no winners" do
		game.player_moves('X', 0)
		game.player_moves('O', 4)
		game.player_moves('X', 8)
		expect(game.check_winning_diagonal('X')).to be_false
	end
end

	context 'anti diagonal line winner' do

		it "winning anti_diagonal line" do
		game.player_moves('X', 2)
		game.player_moves('X', 4)
		game.player_moves('X', 6)
		expect(game.check_winning_anti_diagonal('X')).to be_true
	end
end

	context 'anti diagonal line no winners' do

	it "anti diagonal full, no winners" do
		game.player_moves('X', 0)
		game.player_moves('O', 4)
		game.player_moves('X', 8)
		expect(game.check_winning_diagonal('X')).to be_false
	end
end


end