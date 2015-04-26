require 'spec_helper'
require 'mits/v3.0/deposit'

module MITS
  module V3_0
    describe Deposit do
      it { is_expected.to respond_to(:type) }
      it { is_expected.to respond_to(:description) }
      it { is_expected.to respond_to(:percent_refundable) }
      it { is_expected.to respond_to(:portion_refundable) }
      it { is_expected.to respond_to(:amount) }
    end
  end
end
