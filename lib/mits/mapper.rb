module MITS
  module Mapper
    extend self

    def address(tag)
      attrs = address_attributes(tag)
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
      attrs = company_attributes(tag)
      Company.new(attrs)
    end

    def deposit(tag)
      attrs = {
        amount: deposit_amount(tag[:Amount][:ValueRange]),
        description: tag[:Description],
        percent_refundable: try(tag[:PercentRefundable], :to_f),
        portion_refundable: try(tag[:PortionRefundable], :to_f),
        type: tag[:DepositType],
      }
      Deposit.new(attrs)
    end

    def fees(tag)
      attrs = {
        admin_fee: try(tag[:AdminFee], :to_f),
        application_fee: try(tag[:ApplicationFee], :to_f),
        broker_fee: try(tag[:BrokerFee], :to_f),
        late_fee_per_day: try(tag[:LateFeePerDay], :to_f),
        late_min_fee: try(tag[:LateMinFee], :to_f),
        late_percent: try(tag[:LatePercent], :to_f),
        late_type: tag[:LateType],
        non_refundable_hold_fee: try(tag[:NonRefundableHoldFee], :to_f),
        prorate_type: tag[:ProrateType]
      }
      Fees.new(attrs)
    end

    def property(tag)
      attrs = {
        amenities: amenities(tag[:ILS_Unit][:Amenity]),
        deposit: deposit(tag[:Deposit]),
        fees: fees(tag[:Fee]),
        id: tag[:IDValue],
        name: tag[:PropertyID][:MarketingName],
        units: units(tag[:ILS_Unit][:Units][:Unit]),
        website: tag[:PropertyID][:WebSite]
      }
      Property.new(attrs)
    end

    def units(tags)
      tags = [tags] unless tags.is_a? Array
      tags.map do |tag|
        attrs = {
          bathrooms: try(tag[:UnitBathrooms], :to_f),
          bedrooms: try(tag[:UnitBedrooms], :to_f),
          name: tag[:MarketingName],
          rent: try(tag[:UnitRent], :to_f),
          sqft: unit_sqft(tag)
        }
        Unit.new(attrs)
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

    def try(value, method)
      return nil unless value
      value.send(method)
    end

  end
end
