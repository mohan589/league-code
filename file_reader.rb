require_relative 'score_board'
require_relative 'rank'
require_relative 'print_ranks'
require_relative 'team'

class FileReader
  def self.load_file(input)
    if File.exist?(input[0])
      pass_file =  File.open(input[0], "rb")
      puts PrintRanks.new(pass_file.read).display_data
    else
      "File not found"
    end
  end
end
