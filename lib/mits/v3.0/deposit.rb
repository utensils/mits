module MITS
  module V3_0
    class Deposit
      include SimpleObjects::Base

      attribute :amount
      attribute :description
      attribute :percent_refundable
      attribute :portion_refundable
      attribute :type
    end
  end
end
