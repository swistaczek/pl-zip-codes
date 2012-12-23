# encoding: utf-8
require 'faster_csv'

class PolishNames
  CSV_FILENAME  = 'lib.csv'
  CSV_SEPARATOR = ';'

  class << self
    def load_data
      if @data.nil?
        @data = {}
        FasterCSV.foreach(CSV_FILENAME, headers: true, col_sep: CSV_SEPARATOR) do |csv_obj|
          @data[csv_obj['imie'].downcase] = {
            flexive: csv_obj['odmiana'],
            gender: csv_obj['plec'] == "M" ? :male : (csv_obj['plec'] == "K" ? :female : :unknown ),
            sylable: (csv_obj['sylaby'].to_i rescue 0)
          }
        end
      end
    end

    def parse_name(name)
      load_data
      @data[name.to_s.downcase]
    end
  end
end