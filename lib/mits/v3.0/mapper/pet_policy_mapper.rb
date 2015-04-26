module MITS
  module V3_0
    module Mapper
      module PetPolicyMapper
        def pet_policies(tags, entity = PetPolicy, secondary_entity = Pet)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| pet_policy(tag, entity, secondary_entity) }
        end

        def pet_policy(tag, entity = PetPolicy, secondary_entity = Pet)
          if bool(tag[:Allowed])
            entity.new(allowed:      true,
                       care:         bool(tag[:PetCare]),
                       deposit:      try(tag[:Deposit], :to_f),
                       fee:          try(tag[:Fee], :to_f),
                       pets:         pets(tag[:Pets], secondary_entity),
                       rent:         try(tag[:Rent], :to_f),
                       restrictions: tag[:Restrictions])
          else
            entity.new(allowed: false)
          end
        end

        def pets(tags, entity = Pet)
          tags = [tags] unless tags.is_a? Array
          tags.map do |tag|
            entity.new(count:       tag[:Count].to_i,
                       description: tag[:Description],
                       size:        tag[:Size],
                       weight:      tag[:Weight],
                       type:        tag[:PetType])
          end
        end
      end
    end
  end
end
