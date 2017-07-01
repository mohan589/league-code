class Team
  attr_reader :team_name, :score_details

  def initialize(param)
    data = param.to_s.split
    @score_details = data.pop.to_i
    @team_name = data.join(' ')
  end
end
