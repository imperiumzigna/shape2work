require "shape2work/version"
require 'rgeo'
require 'rgeo/shapefile'

module Shape2work
  class Converter
    def initialize(shapefile = nil, file_out = "output", chosen_format = "geojson")
      @file_input = shapefile
      @file_out = file_out
      @format = chosen_format
      self.convert_to(@file_input, @file_out, @format)
    end

    def self.convert_to()

    end
  end
end

