require 'player'

class Game
  extend Forwardable

  def_delegator :@player1, :score, :player_one_score
  def_delegator :@player2, :score, :player_two_score
  def_delegator :@player1, :scores, :player_one_scores
  def_delegator :@player2, :scores, :player_two_scores

  def initialize player1, player2
    @player1 = player1
    @player2 = player2
  end

  SCORES = [
    'Love',
    'Fifteen',
    'Thirty',
    'Forty'
  ]

  def score
    if winner?
      "#{ highest_scorer } wins!"
    elsif advantage?
      "Advantage #{ highest_scorer }"
    elsif deuce?
      'Deuce'
    elsif tie?
      "#{ tr(highest_score) } all"
    else
      "#{ tr(player_one_score) }, #{ tr(player_two_score) }"
    end
  end

  private
  def tr score
    SCORES[ score ]
  end

  def winner?
    if player_one_score > 3 &&
      player_one_score.pred > player_two_score
      true
    elsif player_two_score > 3 &&
      player_two_score.pred > player_one_score
      true
    else
      false
    end
  end

  def advantage?
    if player_one_score > 3 &&
      player_one_score.pred == player_two_score
      true
    elsif player_two_score > 3 &&
      player_two_score.pred == player_one_score
      true
    else
      false
    end
  end

  def highest_scorer
    if player_one_score > player_two_score
      'Player one'
    else
      'Player two'
    end
  end

  def highest_score
    [ player_one_score, player_two_score ].max
  end

  def deuce?
    tie? &&
      player_one_score > 2 &&
      player_two_score > 2
  end

  def tie?
    player_one_score == player_two_score
  end

  attr_reader :player1, :player2
end

