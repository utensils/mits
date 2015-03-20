module MITS
  class Company
    include SimpleObjects::Base

    attribute :id
    attribute :name
    attribute :address
    attribute :website
    attribute :logo
  end
end
