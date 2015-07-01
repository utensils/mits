module MITS
  module V3_0
    module Mapper
      module AddressMapper
        def address(tag, secondary_tag = nil, entity = Address)
          attrs = address_attributes(tag)

          if secondary_tag
            attrs[:latitude]  = try(secondary_tag[:Latitude], :to_f)
            attrs[:longitude] = try(secondary_tag[:Longitude], :to_f)
          end

          entity.new(attrs)
        end

        private

        def address_attributes(tag)
          {
            address:          try(tag[:Address], :strip),
            city:             try(tag[:City], :strip),
            country:          try(tag[:Country], :strip),
            country_name:     try(tag[:CountyName], :strip),
            description:      try(tag[:Description], :strip),
            postal_code:      try(tag[:PostalCode], :strip),
            province:         try(tag[:Province], :strip),
            state:            try(tag[:State], :strip),
            type:             try(tag[:AddressType], :strip),
            unparsed_address: try(tag[:UnparsedAddress], :strip)
          }
        end
      end
    end
  end
end
