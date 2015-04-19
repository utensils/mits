module MITS
  module V4_1
    module FilesMapper
      def files(tags)
        tags = [tags] unless tags.is_a? Array
        tags.map do |tag|
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
