module MITS
  module V3_0
    module Mapper
      module DepositMapper
        def deposits(tags)
          tags = [tags] unless tags.is_a? Array
          tags.map { |tag| deposit(tag) }
        end

        def deposit(tag)
          Deposit.new(amount:             deposit_amount(tag[:Amount][:ValueRange]),
                      description:        tag[:Description],
                      percent_refundable: try(tag[:PercentRefundable], :to_f),
                      portion_refundable: try(tag[:PortionRefundable], :to_f),
                      type:               tag[:DepositType])
        end
        private

        def deposit_amount(tag)
          if tag[:Exact]
            amount = tag[:Exact].to_f
          else
            min = tag[:Min].to_f
            max = tag[:Max].to_f
            amount = Range.new(min, max)
          end
          amount
        end
      end
    end
  end
end
