module MITS
  module PetPolicyMapper
    def pet_policy(tag)
      if bool(tag[:Allowed])
        PetPolicy.new(allowed:      true,
                      care:         bool(tag[:PetCare]),
                      deposit:      try(tag[:Deposit], :to_f),
                      fee:          try(tag[:Fee], :to_f),
                      pets:         pets(tag[:Pets]),
                      rent:         try(tag[:Rent], :to_f),
                      restrictions: tag[:Restrictions])
      else
        PetPolicy.new(allowed: false)
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
  end
end
