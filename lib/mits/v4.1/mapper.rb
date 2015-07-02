require_relative 'address'
require_relative 'amenity'
require_relative 'company'
require_relative 'deposit'
require_relative 'fees'
require_relative 'file'
require_relative 'pet'
require_relative 'pet_policy'
require_relative 'policy'
require_relative 'property'
require_relative 'unit'

require_relative 'mapper/address_mapper'
require_relative 'mapper/property_mapper'
require_relative 'mapper/units_mapper'

require_relative '../v3.0/mapper/amenities_mapper'
require_relative '../v3.0/mapper/company_mapper'
require_relative '../v3.0/mapper/deposit_mapper'
require_relative '../v3.0/mapper/fees_mapper'
require_relative '../v3.0/mapper/files_mapper'
require_relative '../v3.0/mapper/pet_policy_mapper'
require_relative '../v3.0/mapper/phones_mapper'
require_relative '../v3.0/mapper/policy_mapper'


module MITS
  module V4_1
    module Mapper
      extend BaseMapper

      extend V3_0::Mapper::AmenitiesMapper
      extend V3_0::Mapper::CompanyMapper
      extend V3_0::Mapper::DepositMapper
      extend V3_0::Mapper::FeesMapper
      extend V3_0::Mapper::FilesMapper
      extend V3_0::Mapper::PetPolicyMapper
      extend V3_0::Mapper::PhonesMapper
      extend V3_0::Mapper::PolicyMapper

      extend AddressMapper
      extend PropertyMapper
      extend UnitsMapper
    end
  end
end

