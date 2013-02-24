# encoding: utf-8
require 'csv'

class PlZipCodes
  CSV_FILENAME  = 'lib.csv'
  CSV_SEPARATOR = ';'

  class << self
    def load_data
      if @data.nil?
        @data = []
        CSV.foreach(File.expand_path("../#{CSV_FILENAME}", __FILE__), col_sep: CSV_SEPARATOR) do |csv_obj|
          @data << {
            code: csv_obj[1],
            city: csv_obj[2] || csv_obj[3].capitalize.match(/(\S+).+/)[1],
            province: csv_obj[3].capitalize,
            street: csv_obj[5],
            region: csv_obj[4],
            notes: csv_obj[6]
          }
        end
      end
    end

    def find(code = nil)
      load_data
      if block_given?
        @data.find_all {|k| yield(k) }
      else
        @data.find_all {|k| k[:code] == code.to_s }
      end
    end

    def data
      load_data
      @data
    end

  end
end