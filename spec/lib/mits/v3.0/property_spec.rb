require 'spec_helper'
require 'mits/v3.0/property'

module MITS
  module V3_0
    describe Property do
      it { is_expected.to respond_to(:address) }
      it { is_expected.to respond_to(:amenities) }
      it { is_expected.to respond_to(:company_id) }
      it { is_expected.to respond_to(:deposit) }
      it { is_expected.to respond_to(:description) }
      it { is_expected.to respond_to(:fees) }
      it { is_expected.to respond_to(:files) }
      it { is_expected.to respond_to(:id) }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:phones) }
      it { is_expected.to respond_to(:policy) }
      it { is_expected.to respond_to(:summary) }
      it { is_expected.to respond_to(:type) }
      it { is_expected.to respond_to(:units) }
      it { is_expected.to respond_to(:website) }
    end
  end
end
