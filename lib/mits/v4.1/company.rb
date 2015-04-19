module MITS
  module V4_1
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
