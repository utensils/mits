module MITS
  module V3_0
    class Address
      include SimpleObjects::Base

      attribute :address
      attribute :city
      attribute :country
      attribute :county_name
      attribute :description
      attribute :latitude
      attribute :longitude
      attribute :postal_code
      attribute :province
      attribute :state
      attribute :type
      attribute :unparsed_address
    end
  end
end
