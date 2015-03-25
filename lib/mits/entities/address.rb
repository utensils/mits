module MITS
  class Address
    include SimpleObjects::Base

    attribute :address1
    attribute :address2
    attribute :city
    attribute :country
    attribute :description
    attribute :latitude
    attribute :longitude
    attribute :postal_code
    attribute :state
    attribute :type
  end
end
