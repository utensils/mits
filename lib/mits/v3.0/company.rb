module MITS
  module V3_0
    class Company
      include SimpleObjects::Base

      attribute :id
      attribute :name
      attribute :address
      attribute :website
      attribute :logo
    end
  end
end
