module MITS
  class Address
    include SimpleObjects::Base

    attribute :type
    attribute :description
    attribute :address1
    attribute :address2
    attribute :city
    attribute :state
    attribute :postal_code
    attribute :country
  end
end
