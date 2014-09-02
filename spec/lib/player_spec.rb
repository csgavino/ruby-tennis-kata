require 'player'

describe Player do
  let(:player) { Player.new }

  context '#scores' do
    it "should return 0 if player hasn't scored" do
      expect(player.score).to eq 0
    end

    it 'should return 1 when player scores' do
      player.scores

      expect(player.score).to eq 1
    end

    it 'should return 2 when player scores twice' do
      player.scores
      player.scores

      expect(player.score).to eq 2
    end
  end
end
