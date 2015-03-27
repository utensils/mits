module MITS
  class PetPolicy
    include SimpleObjects::Base

    attribute :allowed
    attribute :care
    attribute :deposit
    attribute :fee
    attribute :pets
    attribute :rent
    attribute :restrictions

    alias_method :allowed?, :allowed
  end
end
