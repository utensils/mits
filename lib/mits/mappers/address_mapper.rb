module MITS
  module AddressMapper
    def address(tag, secondary_tag = nil)
      attrs = address_attributes(tag)

      if secondary_tag
        attrs[:latitude] = try(secondary_tag[:Latitude], :to_f)
        attrs[:longitude] = try(secondary_tag[:Longitude], :to_f)
      end

      Address.new(attrs)
    end

    private

    def address_attributes(tag)
      {
        type:        tag[:AddressType],
        description: tag[:Description],
        address1:    tag[:AddressLine1],
        address2:    tag[:AddressLine2],
        city:        tag[:City],
        state:       tag[:State],
        postal_code: tag[:PostalCode],
        country:     tag[:Country],
      }
    end
  end
end
