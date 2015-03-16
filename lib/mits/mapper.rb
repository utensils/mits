module MITS
  module Mapper
    extend self

    def address(tag)
      attrs = address_attributes(tag)
      Address.new(attrs)
    end

    def company(tag)
      attrs = company_attributes(tag)
      Company.new(attrs)
    end

    private

    def company_attributes(tag)
      {
        address: address(tag[:Address]),
        id:      tag[:Identification][:IDValue],
        logo:    tag[:Logo],
        name:    tag[:CompanyName],
        website: tag[:Website]
      }
    end

    def address_attributes(tag)
      {
        type:        tag[:AddressType],
        description: tag[:Description],
        address1:    tag[:addressline1],
        address2:    tag[:addressline2],
        city:        tag[:City],
        state:       tag[:State],
        postal_code: tag[:PostalCode],
        country:     tag[:Country],
      }
    end

  end
end
