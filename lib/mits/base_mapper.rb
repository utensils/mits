module MITS
  module BaseMapper
    protected

    def bool(value)
      value == 'true'
    end

    def try(value, method)
      return nil unless value
      if value.respond_to?(method)
        value.send(method)
      elsif self.respond_to?(method)
        self.send(method, value)
      end
    end
  end
end
