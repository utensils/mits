module MITS
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
      {
        address:     address(tag[:PropertyID][:Address], tag[:ILS_Identification]),
        amenities:   amenities(tag[:ILS_Unit][:Amenity]),
        deposit:     deposit(tag[:Deposit]),
        fees:        fees(tag[:Fee]),
        files:       files(tag[:File]),
        pet_policy:  pet_policy(tag[:Policy][:Pet]),
        units:       units(tag[:ILS_Unit][:Units][:Unit])
      }
    end

    def company_id(tags)
      tag = tags.find { |t| t[:IDType].downcase == 'company' }
      tag[:IDValue] if tag
    end
  end
end
