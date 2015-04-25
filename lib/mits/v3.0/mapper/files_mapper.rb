module MITS
  module V3_0
    module Mapper
      module FilesMapper
        def files(tags)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| file(tag) }
        end

        def file(tag)
          File.new(active:      bool(tag[:Active]),
                   caption:     tag[:Caption],
                   description: tag[:Description],
                   format:      tag[:Format],
                   height:      try(tag[:Height], :to_i),
                   id:          tag[:FileID],
                   name:        tag[:Name],
                   rank:        tag[:Rank],
                   source:      tag[:Src],
                   width:       tag[:Width])
        end
      end
    end
  end
end
