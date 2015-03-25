module MITS
  module Mapper
    extend self

    def address(tag, secondary_tag = nil)
      attrs = address_attributes(tag)

      if secondary_tag
        attrs[:latitude] = try(secondary_tag[:Latitude], :to_f)
        attrs[:longitude] = try(secondary_tag[:Longitude], :to_f)
      end

      Address.new(attrs)
    end

    def amenities(tags)
      if tags
        tags = [tags] unless tags.is_a? Array
        tags.map { |tag| amenity(tag) }
      end
    end

    def amenity(tag)
      Amenity.new(description: tag[:Description], type: tag[:AmenityType])
    end

    def company(tag)
      Company.new(address: address(tag[:Address]),
                  id:      tag[:Identification][:IDValue],
                  logo:    tag[:Logo],
                  name:    tag[:CompanyName],
                  website: tag[:Website])
    end

    def deposit(tag)
      Deposit.new(amount:             deposit_amount(tag[:Amount][:ValueRange]),
                  description:        tag[:Description],
                  percent_refundable: try(tag[:PercentRefundable], :to_f),
                  portion_refundable: try(tag[:PortionRefundable], :to_f),
                  type:               tag[:DepositType])
    end

    def fees(tag)
      Fees.new(admin_fee:               try(tag[:AdminFee], :to_f),
               application_fee:         try(tag[:ApplicationFee], :to_f),
               broker_fee:              try(tag[:BrokerFee], :to_f),
               late_fee_per_day:        try(tag[:LateFeePerDay], :to_f),
               late_min_fee:            try(tag[:LateMinFee], :to_f),
               late_percent:            try(tag[:LatePercent], :to_f),
               late_type:               tag[:LateType],
               non_refundable_hold_fee: try(tag[:NonRefundableHoldFee], :to_f),
               prorate_type:            tag[:ProrateType])
    end

    def files(tags)
      tags = [tags] unless tags.is_a? Array
      tags.map do |tag|
        File.new(active:      try_bool(tag[:Active]),
                 caption:     tag[:Caption],
                 description: tag[:Description],
                 format:      tag[:Format],
                 height:      try(tag[:Height], :to_i),
                 id:          tag[:FileID],
                 name:        tag[:Name],
                 rank:        tag[:Rank],
                 source:      tag[:Src],
                 width:       tag[:Width])
      end
    end

    def pets(tags)
      tags = [tags] unless tags.is_a? Array
      tags.map do |tag|
        Pet.new(count:       tag[:Count].to_i,
                description: tag[:Description],
                size:        tag[:Size],
                weight:      tag[:Weight],
                type:        tag[:PetType])
      end
    end

    def pet_policy(tag)
      PetPolicy.new(allowed:      try_bool(tag[:Allowed]),
                    care:         try_bool(tag[:PetCare]),
                    deposit:      try(tag[:Deposit], :to_f),
                    fee:          try(tag[:Fee], :to_f),
                    pets:         pets(tag[:Pets]),
                    rent:         try(tag[:Rent], :to_f),
                    restrictions: tag[:Restrictions])
    end

    def property(tag)
      Property.new(address:     address(tag[:PropertyID][:Address], tag[:ILS_Identification]),
                   amenities:   amenities(tag[:ILS_Unit][:Amenity]),
                   deposit:     deposit(tag[:Deposit]),
                   description: tag[:Information][:LongDescription],
                   fees:        fees(tag[:Fee]),
                   files:       files(tag[:File]),
                   id:          tag[:IDValue],
                   name:        tag[:PropertyID][:MarketingName],
                   pet_policy:  tag[:Policy][:Pet],
                   summary:     tag[:Information][:ShortDescription],
                   units:       units(tag[:ILS_Unit][:Units][:Unit]),
                   website:     tag[:PropertyID][:WebSite])

    end

    def units(tags)
      tags = [tags] unless tags.is_a? Array
      tags.map do |tag|
        Unit.new(bathrooms: try(tag[:UnitBathrooms], :to_f),
                 bedrooms:  try(tag[:UnitBedrooms], :to_f),
                 name:      tag[:MarketingName],
                 rent:      try(tag[:UnitRent], :to_f),
                 sqft:      unit_sqft(tag))
      end
    end

    private

    def deposit_amount(tag)
      if tag[:Exact]
        amount = tag[:Exact].to_f
      else
        min = tag[:Min].to_f
        max = tag[:Max].to_f
        amount = Range.new(min, max)
      end
      amount
    end

    def unit_sqft(tag)
      min = tag[:MinSquareFeet]
      max = tag[:MaxSquareFeet]
      Range.new(min.to_i, max.to_i)
    end

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

    def try_bool(value)
      value == 'true'
    end

    def try(value, method)
      return nil unless value
      value.send(method)
    end

  end
end
