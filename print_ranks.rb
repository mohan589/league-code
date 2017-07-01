class PrintRanks
  def initialize(input_data)
    @ranking_data = Rank.new(input_data).compute
  end

  def display_data
    @ranking_data.map.with_index(1) do |value, index|
      "#{index}. #{value.keys.first}, #{format_data value.values.first}"
    end
  end

  private

  def format_data(params)
    return "#{params} pt" if params == 1
    "#{params} pts"
  end
end
