module MITS
  module V4_1
    class Address
      include SimpleObjects::Base

      attribute :address1
      attribute :address2
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
