module MITS
  module V3_0
    module Mapper
      module FloorplanMapper
        def floorplans(tags)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| floorplan(tag) }
        end

        def floorplan(tag)
          Floorplan.new(bathrooms: try(rooms(tag[:Room], 'Bathroom'), :to_f),
                        bedrooms:  try(rooms(tag[:Room], 'Bedroom'), :to_i),
                        name:      tag[:Name],
                        rent:      range_tag(tag[:MarketRent]),
                        sqft:      range_tag(tag[:SquareFeet]))
        end

        private

        def rooms(tag, type)
          tags = [tags] unless tags.is_a? Array
          room = tag.find { |t| t[:RoomType] == type }
          room[:Count] if room
        end
      end
    end
  end
end
