require_relative 'address'
require_relative 'amenity'
require_relative 'company'
require_relative 'deposit'
require_relative 'fees'
require_relative 'file'
require_relative 'pet'
require_relative 'pet_policy'
require_relative 'property'
require_relative 'unit'

require_relative 'mapper/address_mapper'
require_relative 'mapper/amenities_mapper'
require_relative 'mapper/company_mapper'
require_relative 'mapper/deposit_mapper'
require_relative 'mapper/fees_mapper'
require_relative 'mapper/files_mapper'
require_relative 'mapper/pet_policy_mapper'
require_relative 'mapper/property_mapper'
require_relative 'mapper/units_mapper'

module MITS
  module V4_1
    module Mapper
      extend BaseMapper

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
    end
  end
end

