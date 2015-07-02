module MITS
  module V3_0
    module Mapper
      module FilesMapper
        def files(tags, entity = File)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| file(tag, entity) }
        end

        def file(tag, entity = File)
          entity.new(active:      bool(tag[:Active]),
                     caption:     tag[:Caption],
                     description: tag[:Description],
                     format:      tag[:Format],
                     height:      try(tag[:Height], :to_i),
                     id:          tag[:FileID],
                     name:        tag[:Name],
                     rank:        tag[:Rank],
                     source:      tag[:Src],
                     type:        tag[:FileType],
                     width:       tag[:Width])
        end
      end
    end
  end
end
