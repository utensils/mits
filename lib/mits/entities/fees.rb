module MITS
  class Fees
    include SimpleObjects::Base

    attribute :admin_fee
    attribute :application_fee
    attribute :broker_fee
    attribute :late_fee_per_day
    attribute :late_min_fee
    attribute :late_percent
    attribute :late_type
    attribute :non_refundable_hold_fee
    attribute :prorate_type
  end
end
