module MITS
  module V3_0
    module Mapper
      module AmenitiesMapper
        def amenities(tags)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| amenity(tag) }
        end

        def amenity(tag)
          Amenity.new(description: tag[:Description],
                      rank:        tag[:Rank],
                      subtype:     tag[:AmenitySubType],
                      type:        tag[:AmenityType])
        end
      end
    end
  end
end
