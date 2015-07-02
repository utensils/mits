module MITS
  module V3_0
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
            company_id:  company_id(tag[:Identification], propId[:Identification]),
            description: tag[:Information][:LongDescription],
            id:          primary_id(propId[:Identification]),
            name:        propId[:MarketingName],
            summary:     tag[:Information][:ShortDescription],
            type:        tag[:ILS_Identification][:ILS_IdentificationType],
            website:     propId[:WebSite]
          }
        end

        def property_details(tag)
          details = {}

          # Optional fields
          details[:address]    = address(tag[:PropertyID][:Address], tag[:ILS_Identification]) if tag[:PropertyID][:Address]
          details[:amenities]  = try(tag[:Amenity], :amenities)
          details[:deposit]    = try(tag[:Deposit], :deposits)
          details[:fees]       = try(tag[:Fee], :fees)
          details[:files]      = try(tag[:File], :files)
          details[:phones]     = try(tag[:PropertyID][:Phone], :phones)
          details[:policy]     = try(tag[:Policy], :policy)
          details[:floorplans] = try(tag[:Floorplan], :floorplans)

          details
        end

        def primary_id(tags)
          find_in_tags(tags, 'primaryid')
        end

        def company_id(*tags)
          find_in_tags(tags.flatten, 'managementid')
        end

        def find_in_tags(tags, type)
          tags = [tags] unless tags.is_a? Array
          tag = tags.find { |t| t[:IDType].downcase == type.downcase }
          tag[:IDValue] if tag
        end
      end
    end
  end
end
