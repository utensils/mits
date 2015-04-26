require 'mits/v3.0/mapper/address_mapper'

module MITS
  module V4_1
    module Mapper
      module AddressMapper
        include V3_0::Mapper::AddressMapper

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
end
