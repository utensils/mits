# :nocov:
module Saxerator
  module Builder
    class HashElement < Hash
      def deep_hash
        self.reduce({}) do |memo, (key, value)|
          as_hash = if value.is_a? Array
                      value.map { |v| try_hash(v) }
                    else
                      try_hash(value)
                    end
          memo[key] = as_hash
          memo
        end
      end

      def try_hash(val)
        if val.is_a? EmptyElement
          nil
        elsif val.respond_to? :deep_hash
          val.deep_hash
        elsif val.respond_to? :to_h
          val.to_h
        else
          val
        end
      end
    end
  end
end
# :nocov:
