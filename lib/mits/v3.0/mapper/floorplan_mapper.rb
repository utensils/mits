module MITS
  module V3_0
    module Mapper
      module FloorplanMapper
        def floorplans(tags, fp = Floorplan)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| floorplan(tag, fp) }
        end

        def floorplan(tag, floorplan = Floorplan)
          floorplan.new(bathrooms: try(rooms(tag[:Room], 'Bathroom'), :to_f),
                        bedrooms:  try(rooms(tag[:Room], 'Bedroom'), :to_i),
                        name:      tag[:Name],
                        rent:      range_tag(tag[:MarketRent]),
                        sqft:      range_tag(tag[:SquareFeet]))
        end

        private

        def rooms(tags, type)
          tags = [tags] unless tags.is_a? Array
          room = tags.find { |t| t[:RoomType] == type }
          room[:Count] if room
        end
      end
    end
  end
end
