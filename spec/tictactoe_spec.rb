require 'tictactoe.rb'

def game 
	@game ||= Tic_Tac_Toe_Game.new
end

describe '.initialize' do

	context "when the Tic_Tac_Toe_Game loads" do
		it 'should load with an empty board' do
			expect(game.board_empty?).to be_true
		end
	end
end

describe '.player_move' do

  context 'when the grid position is unoccupied'	do
  	it 'should be allowed to place a symbol' do
			expect(game.player_move(T_Constants::X_MARK, 3)).to be_true
	 	end
  end

	context 'when the grid position is occupied'	do
  	it 'should not be allowed to place a symbol' do
  		game.player_move(T_Constants::X_MARK, 3)
  		expect(game.player_move(T_Constants::X_MARK, 3)).to be_false
	 	end
  end
 end
