require 'game'

describe Game do
  let(:player1) { Player.new }
  let(:player2) { Player.new }
  let(:g) { Game.new(player1, player2) }

  context '#score' do
    it 'should be love all at the start of the game' do
      expect(g.score).to eq 'Love all'
    end

    it 'should be fifteen love when player one scores' do
      g.player_one_scores

      expect(g.score).to eq 'Fifteen, Love'
    end

    it 'should be thiry love when player one scores twice' do
      score 2, 0

      expect(g.score).to eq 'Thirty, Love'
    end

    it 'should be forty love when player one scores thrice' do
      score 3, 0

      expect(g.score).to eq 'Forty, Love'
    end

    it 'should be player one wins when player one scores four times' do
      score 4, 0

      expect(g.score).to eq 'Player one wins!'
    end

    it 'should be thirty fifteen when player one scores twice and player two scores once' do
      score 2, 1

      expect(g.score).to eq 'Thirty, Fifteen'
    end

    it 'should be forty fifteen when player one scores thrice and player two scores once' do
      score 3, 1

      expect(g.score).to eq 'Forty, Fifteen'
    end

    it 'should be love fifteen when player two scores' do
      score 0, 1

      expect(g.score).to eq 'Love, Fifteen'
    end

    it 'should be player two wins when player two scores four times' do
      score 0, 4

      expect(g.score).to eq 'Player two wins!'
    end

    it 'should be player one wins when player one scores four times and player two scores twice' do
      score 4, 2

      expect(g.score).to eq 'Player one wins!'
    end

    it 'should be player two wins when player two scores four times and player one scores once' do
      score 2, 4

      expect(g.score).to eq 'Player two wins!'
    end

    it 'should be deuce when both players scores thrice' do
      score 3, 3

      expect(g.score).to eq 'Deuce'
    end

    it 'should be fifteen all when both players scores' do
      score 1, 1

      expect(g.score).to eq 'Fifteen all'
    end

    it 'should be thirty all when both players scores twice' do
      score 2, 2

      expect(g.score).to eq 'Thirty all'
    end

    it 'should be advantage player one when player one scores after deuce' do
      score 3, 3
      g.player_one_scores

      expect(g.score).to eq 'Advantage Player one'
    end

    it 'should be advantage player two when player one scores after deuce' do
      score 3, 3
      g.player_two_scores

      expect(g.score).to eq 'Advantage Player two'
    end

    it 'should be deuce again when both players score after deuce' do
      score 3, 3
      g.player_one_scores
      g.player_two_scores

      expect(g.score).to eq 'Deuce'
    end

    it 'should be player one wins after player one scores twice after deuce' do
      score 6, 4

      expect(g.score).to eq 'Player one wins!'
    end

    def score player_one_scores, player_two_scores
      player_one_scores.times { g.player_one_scores }
      player_two_scores.times { g.player_two_scores }
    end
  end
end

