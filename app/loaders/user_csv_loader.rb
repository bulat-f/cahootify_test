require 'csv'

class UserCsvLoader
  def initialize(path)
    @path = path
  end

  def build_params
    rows = []
    CSV.foreach(@path, headers: true) do |row|
      rows << { name: row[0], email: row[1], phone: row[2], website: row[3] }
    end
    rows
  end
end
