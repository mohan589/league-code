class Rank
  attr_reader :scores_data, :games_data

  def initialize(input)
    @games_data = input.split("\n")
    @scores_data = games_data.map { |game| ScoreBoard.new(game).compute }
  end

  def compute
    return [] if scores_data.empty?
    scores_compute.sort_by(&:values).reverse
  end

  private

  def scores_compute
    scores_data.flat_map(&:entries).group_by(&:first)
    .map do |key, value|
      Hash[key, value.map(&:last).inject(0) { |sum, v| sum + v }]
    end
  end
end
