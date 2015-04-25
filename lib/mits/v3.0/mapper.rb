require_relative 'address'
require_relative 'amenity'
require_relative 'company'
require_relative 'deposit'
require_relative 'fees'
require_relative 'file'
require_relative 'floorplan'
require_relative 'pet'
require_relative 'pet_policy'
require_relative 'policy'
require_relative 'property'

require_relative 'mapper/address_mapper'
require_relative 'mapper/amenities_mapper'
require_relative 'mapper/company_mapper'
require_relative 'mapper/deposit_mapper'
require_relative 'mapper/fees_mapper'
require_relative 'mapper/files_mapper'
require_relative 'mapper/floorplan_mapper'
require_relative 'mapper/pet_policy_mapper'
require_relative 'mapper/policy_mapper'
require_relative 'mapper/property_mapper'

module MITS
  module V3_0
    module Mapper
      extend BaseMapper

      extend AddressMapper
      extend AmenitiesMapper
      extend CompanyMapper
      extend DepositMapper
      extend FeesMapper
      extend FilesMapper
      extend FloorplanMapper
      extend PetPolicyMapper
      extend PolicyMapper
      extend PropertyMapper

      def range_tag(tag)
        min = tag[:Min]
        max = tag[:Max]
        Range.new(min.to_i, max.to_i)
      end

      extend self
    end
  end
end

