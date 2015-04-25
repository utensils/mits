module MITS
  module V3_0
    module Mapper
      module PolicyMapper
        def policy(tag)
          pet_policies = pet_policies(tag[:Pet])
          Policy.new(general: tag[:General], pet: pet_policies)
        end
      end
    end
  end
end
