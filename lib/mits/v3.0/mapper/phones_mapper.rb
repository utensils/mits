module MITS
  module V3_0
    module Mapper
      module PhonesMapper
        def phones(tags, entity = Phone)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| phone(tag, entity) }
        end

        def phone(tag, entity = Phone)
          entity.new(extension: tag[:Extension],
                     number:    tag[:PhoneNumber],
                     type:      tag[:PhoneType])
        end
      end
    end
  end
end
