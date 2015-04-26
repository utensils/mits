require 'mits/v3.0/amenity'
module SimpleObjects
  module Attributes
    module ClassMethods
      def attributes
        unless @attributes
          @attributes = superclass.attributes if superclass.respond_to? :attributes
          @attributes ||= {}
        end
        @attributes
      end
    end
  end
end

module MITS
  module V4_1
    class Amenity < V3_0::Amenity
    end
  end
end
