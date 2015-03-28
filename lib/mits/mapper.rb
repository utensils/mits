require 'mits/entities/address'
require 'mits/entities/amenity'
require 'mits/entities/company'
require 'mits/entities/deposit'
require 'mits/entities/fees'
require 'mits/entities/file'
require 'mits/entities/pet'
require 'mits/entities/pet_policy'
require 'mits/entities/property'
require 'mits/entities/unit'

require 'mits/mappers/address_mapper'
require 'mits/mappers/amenities_mapper'
require 'mits/mappers/company_mapper'
require 'mits/mappers/deposit_mapper'
require 'mits/mappers/fees_mapper'
require 'mits/mappers/files_mapper'
require 'mits/mappers/pet_policy_mapper'
require 'mits/mappers/property_mapper'
require 'mits/mappers/units_mapper'

module MITS
  module Mapper
    extend AddressMapper
    extend AmenitiesMapper
    extend CompanyMapper
    extend DepositMapper
    extend FeesMapper
    extend FilesMapper
    extend PetPolicyMapper
    extend PropertyMapper
    extend UnitsMapper

    extend self

    protected

    def bool(value)
      value == 'true'
    end

    def try(value, method)
      return nil unless value
      if value.respond_to?(method)
        value.send(method)
      elsif self.respond_to?(method)
        self.send(method, value)
      end
    end
  end
end
