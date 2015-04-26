require 'spec_helper'
require 'mits/v4.1/fees'

module MITS
  module V4_1
    describe Fees do
      it { is_expected.to respond_to(:admin_fee) }
      it { is_expected.to respond_to(:application_fee) }
      it { is_expected.to respond_to(:broker_fee) }
      it { is_expected.to respond_to(:late_fee_per_day) }
      it { is_expected.to respond_to(:late_min_fee) }
      it { is_expected.to respond_to(:late_percent) }
      it { is_expected.to respond_to(:late_type) }
      it { is_expected.to respond_to(:non_refundable_hold_fee) }
      it { is_expected.to respond_to(:prorate_type) }
    end
  end
end
