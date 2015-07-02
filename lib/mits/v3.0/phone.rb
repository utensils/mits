module MITS
  module V3_0
    class Phone
      include SimpleObjects::Base

      attribute :extension
      attribute :number
      attribute :type
    end
  end
end
