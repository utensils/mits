module MITS
  module BaseMapper
    protected

    def bool(value)
      value == 'true'
    end

    def range_tag(tag)
      min = tag[:Min]
      max = tag[:Max]
      Range.new(min.to_i, max.to_i)
    end

    def try(*values, method)
      value, *args = values
      return nil unless value
      if value.respond_to?(method)
        value.send(method)
      elsif self.respond_to?(method)
        args = [args] unless args.is_a? Array
        self.send(method, value, *args)
      end
    end
  end
end
