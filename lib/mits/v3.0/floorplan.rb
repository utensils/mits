module MITS
  module V3_0
    class Floorplan
      include SimpleObjects::Base

      attribute :bathrooms
      attribute :bedrooms
      attribute :name
      attribute :rent
      attribute :sqft
    end
  end
end
