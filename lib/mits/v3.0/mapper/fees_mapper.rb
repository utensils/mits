module MITS
  module V3_0
    module Mapper
      module FeesMapper
        def fees(tag, entity = Fees)
          entity.new(admin_fee:               try(tag[:AdminFee], :to_f),
                     application_fee:         try(tag[:ApplicationFee], :to_f),
                     broker_fee:              try(tag[:BrokerFee], :to_f),
                     late_fee_per_day:        try(tag[:LateFeePerDay], :to_f),
                     late_min_fee:            try(tag[:LateMinFee], :to_f),
                     late_percent:            try(tag[:LatePercent], :to_f),
                     late_type:               tag[:LateType],
                     non_refundable_hold_fee: try(tag[:NonRefundableHoldFee], :to_f),
                     prorate_type:            tag[:ProrateType])
        end
      end
    end
  end
end
