module MITS
  class Pet
    include SimpleObjects::Base

    attribute :count
    attribute :description
    attribute :size
    attribute :type
    attribute :weight
  end
end
