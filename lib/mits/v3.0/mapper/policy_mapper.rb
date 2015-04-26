module MITS
  module V3_0
    module Mapper
      module PolicyMapper
        def policy(tag, policy = Policy, pet_policy = PetPolicy, pet = Pet)
          pet_policies = pet_policies(tag[:Pet], pet_policy, pet)
          policy.new(general: tag[:General], pet: pet_policies)
        end
      end
    end
  end
end
