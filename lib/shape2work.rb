require 'shape2work/version'
require 'rgeo'
require 'rgeo/shapefile'
require 'rgeo/geo_json'

module Shape2work
  class Converter
    # @param [string] _chosen_format
    # @param [string] _file_out
    # @param [string] _shapefile
    def convert_to(shapefile = nil, file_out = 'output', chosen_format = 'geojson')
      unless shapefile.nil?
        RGeo::Shapefile::Reader.open(shapefile) do |file|
          open("#{file_out}.#{chosen_format}", 'w+') do |f|
            f.puts '{' + '"type":' + '"FeatureCollection"' + ','
            f.puts '"features":' + '['
            file.each do |record|
              f.puts '{ "type": "Feature",'
              f.puts '"id": ' + "#{record.index},"
              f.puts '"geometry":' + "#{walk_geometry(record.geometry)},"
              if file.next
                f.puts '"properties": ' + " #{record.attributes.to_json}},"
              else
                f.puts '"properties": ' + " #{record.attributes.to_json}}"
              end
            end
            f.puts ']}'
          end
        end
      end
    end

    private

    def walk_geometry(geometry)
      geo = RGeo::GeoJSON.encode(geometry)
      RGeo::GeoJSON.encode(RGeo::GeoJSON.decode(geo)).to_json
    end
  end
end
