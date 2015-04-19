module MITS
  module V4_1
    module UnitsMapper
      def units(tags)
        tags = [tags] unless tags.is_a? Array
        tags.map do |tag|
          Unit.new(bathrooms: try(tag[:UnitBathrooms], :to_f),
                   bedrooms:  try(tag[:UnitBedrooms], :to_f),
                   name:      tag[:MarketingName],
                   rent:      try(tag[:UnitRent], :to_f),
                   sqft:      unit_sqft(tag))
        end
      end

      private

      def unit_sqft(tag)
        min = tag[:MinSquareFeet]
        max = tag[:MaxSquareFeet]
        Range.new(min.to_i, max.to_i)
      end
    end
  end
end
