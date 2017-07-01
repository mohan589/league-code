require 'pry'
class ScoreBoard
  attr_reader :first_team, :second_team

  def initialize(params)
    games = params.split(',')
    @first_team = Team.new(games.slice(0))
    @second_team = Team.new(games.slice(1))
  end

  def compute
    equal_score || compare(first_team, second_team) || compare(second_team, first_team)
  end

  private

  def equal_score
    Hash[first_team.team_name, 1, second_team.team_name, 1] if first_team.score_details == second_team.score_details
  end

  def compare(higher, lower)
    Hash[higher.team_name, 3, lower.team_name, 0] if higher.score_details > lower.score_details
  end
end
