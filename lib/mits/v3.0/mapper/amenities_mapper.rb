module MITS
  module V3_0
    module Mapper
      module AmenitiesMapper
        def amenities(tags, entity = Amenity)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| amenity(tag, entity) }
        end

        def amenity(tag, entity = Amenity)
          entity.new(description: tag[:Description],
                     rank:        tag[:Rank],
                     subtype:     tag[:AmenitySubType],
                     type:        tag[:AmenityType])
        end
      end
    end
  end
end
