module MITS
  module AmenitiesMapper
    def amenities(tags)
      tags = [tags] unless tags.is_a? Array
      tags.map { |tag| amenity(tag) }
    end

    def amenity(tag)
      Amenity.new(description: tag[:Description], type: tag[:AmenityType])
    end
  end
end
