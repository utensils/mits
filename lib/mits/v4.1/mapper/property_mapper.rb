module MITS
  module V4_1
    module Mapper
      module PropertyMapper
        def property(tag)
          basics  = property_basics(tag)
          details = property_details(tag)
          Property.new(basics.merge(details))
        end

        private

        def property_basics(tag)
          propId = tag[:PropertyID]
          {
            company_id:  company_id(propId[:Identification]),
            description: tag[:Information][:LongDescription],
            id:          tag[:IDValue],
            name:        propId[:MarketingName],
            summary:     tag[:Information][:ShortDescription],
            type:        tag[:ILS_Identification][:ILS_IdentificationType],
            website:     propId[:WebSite]
          }
        end

        def property_details(tag)
          details = {}

          # Optional fields
          details[:address]    = try(tag[:PropertyID][:Address], tag[:ILS_Identification], Address, :address)
          details[:amenities]  = try(tag[:ILS_Unit][:Amenity], Amenity, :amenities)
          details[:deposit]    = try(tag[:Deposit], Deposit, :deposit)
          details[:fees]       = try(tag[:Fee], Fees, :fees)
          details[:floorplans] = try(tag[:Floorplan], Floorplan, :floorplans)
          details[:files]      = try(tag[:File], File, :files)
          details[:policy]     = try(tag[:Policy], Policy, PetPolicy, Pet, :policy)
          details[:units]      = try(tag[:ILS_Unit][:Units][:Unit], :units)

          details
        end

        def company_id(tags)
          tag = tags.find { |t| t[:IDType].downcase == 'company' }
          tag[:IDValue] if tag
        end
      end
    end
  end
end
