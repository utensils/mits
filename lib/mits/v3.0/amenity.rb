module MITS
  module V3_0
    class Amenity
      include SimpleObjects::Base

      attribute :description
      attribute :rank
      attribute :subtype
      attribute :type
    end
  end
end
