module MITS
  module V3_0
    class Property
      include SimpleObjects::Base

      attribute :address
      attribute :amenities, default: []
      attribute :company_id
      attribute :deposit
      attribute :description
      attribute :fees, default: []
      attribute :files, default: []
      attribute :floorplans, default: []
      attribute :id
      attribute :name
      attribute :phones, default: []
      attribute :policy
      attribute :summary
      attribute :type
      attribute :units, default: []
      attribute :website
    end
  end
end
