module MITS
  module V4_1
    module AddressMapper
      def address(tag, secondary_tag = nil)
        attrs = address_attributes(tag)

        if secondary_tag
          attrs[:latitude]  = try(secondary_tag[:Latitude], :to_f)
          attrs[:longitude] = try(secondary_tag[:Longitude], :to_f)
        end

        Address.new(attrs)
      end

      private

      def address_attributes(tag)
        {
          address1:         tag[:AddressLine1],
          address2:         tag[:AddressLine2],
          city:             tag[:City],
          country:          tag[:Country],
          country_name:     tag[:CountyName],
          description:      tag[:Description],
          postal_code:      tag[:PostalCode],
          province:         tag[:Province],
          state:            tag[:State],
          type:             tag[:AddressType],
          unparsed_address: tag[:UnparsedAddress]
        }
      end
    end
  end
end
