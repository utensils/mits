require 'spec_helper'
require 'mits/v3.0/pet'

module MITS
  module V3_0
    describe Pet do
      it { is_expected.to respond_to(:count) }
      it { is_expected.to respond_to(:description) }
      it { is_expected.to respond_to(:size) }
      it { is_expected.to respond_to(:type) }
      it { is_expected.to respond_to(:weight) }
    end
  end
end

