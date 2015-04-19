module MITS
  module V4_1
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
        details[:address]    = address(tag[:PropertyID][:Address], tag[:ILS_Identification]) if tag[:PropertyID][:Address]
        details[:amenities]  = amenities(tag[:ILS_Unit][:Amenity]) if tag[:ILS_Unit][:Amenity]
        details[:deposit]    = try(tag[:Deposit], :deposit)
        details[:fees]       = try(tag[:Fee], :fees)
        details[:files]      = try(tag[:File], :files)
        details[:pet_policy] = try(tag[:Policy][:Pet], :pet_policy)
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
