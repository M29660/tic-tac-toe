require 'checker.rb'

def checker
	@checker ||= Checker.new
end

describe '.board_empty?' do
	
	context 'when board is empty' do
		it 'should not have any player symbols' do
			board = Array.new(9," ")
			expect(checker.board_empty?(board) ).to be_true
		end
	end 

	context 'when board not empty' do 
		it 'should have at least one player symbol' do
			game.player_move(T_Constants::X_MARK, 3)
			expect(game.board_empty?).to be_false
		end
	end

	context 'when the grid position is occupied'	do
  	it 'should not be allowed to place a symbol' do
  		game.player_move(T_Constants::X_MARK, 3)
  		expect(game.player_move(T_Constants::X_MARK, 3)).to be_false
	 	end
  end
end

describe '.player_win?'	do

	context 'when its a winning row' do
		it 'should show a player with a winning row' do
 			game.player_move(T_Constants::X_MARK, 0)
			game.player_move(T_Constants::O_MARK, 1)
			game.player_move(T_Constants::X_MARK, 2)
			game.player_move(T_Constants::X_MARK, 3)
			game.player_move(T_Constants::X_MARK, 4)
			game.player_move(T_Constants::X_MARK, 5)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_true
		end
	end

	context 'when the row is full and there is no winner' do
		it 'should show the row is full, no winner' do
			game.player_move(T_Constants::X_MARK, 0)
			game.player_move(T_Constants::O_MARK, 1)
			game.player_move(T_Constants::X_MARK, 2)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_false
		end
	end

	context 'when column is a winning column' do
		it 'should show a player with a winning column' do
			game.player_move(T_Constants::X_MARK, 2)
			game.player_move(T_Constants::X_MARK, 5)
			game.player_move(T_Constants::X_MARK, 8)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_true
		end
 	end

	context 'when no winner on a full column' do
		it "should show column is full, no winner" do
			game.player_move(T_Constants::X_MARK, 0)
			game.player_move(T_Constants::O_MARK, 3)
			game.player_move(T_Constants::X_MARK, 6)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_false	
		end
	end


	context 'when diagonal line has a winner' do
		it "should show winning diagonal line" do
			game.player_move(T_Constants::X_MARK, 0)
			game.player_move(T_Constants::X_MARK, 4)
			game.player_move(T_Constants::X_MARK, 8)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_true
		end
	end

	context 'when no winner on a full diagonal line' do
		it "should show diagonal full, no winners" do
			game.player_move(T_Constants::X_MARK, 0)
			game.player_move(T_Constants::O_MARK, 4)
			game.player_move(T_Constants::X_MARK, 8)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_false
		end
	end
end

describe '.wining anti diagonal'	do

	context 'when anti diagonal line has a winner' do
		it "should show winning anti_diagonal line" do
			game.player_move(T_Constants::X_MARK, 2)
			game.player_move(T_Constants::X_MARK, 4)
			game.player_move(T_Constants::X_MARK, 6)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_true
		end
	end
end

describe '.anti diagonal with no winners'	do

	context 'when anti diagonal line has no winners' do
		it "should show anti diagonal full, no winners" do
			game.player_move(T_Constants::X_MARK, 0)
			game.player_move(T_Constants::O_MARK, 4)
			game.player_move(T_Constants::X_MARK, 8)
			expect(checker.player_win?(T_Constants::X_MARK, game.board)).to be_false
		end
	end
end