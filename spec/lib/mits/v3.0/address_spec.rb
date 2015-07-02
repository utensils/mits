require 'spec_helper'
require 'mits/v3.0/address'

module MITS
  module V3_0
    describe Address do
      it { is_expected.to respond_to(:address) }
      it { is_expected.to respond_to(:city) }
      it { is_expected.to respond_to(:country) }
      it { is_expected.to respond_to(:county_name) }
      it { is_expected.to respond_to(:description) }
      it { is_expected.to respond_to(:email) }
      it { is_expected.to respond_to(:latitude) }
      it { is_expected.to respond_to(:longitude) }
      it { is_expected.to respond_to(:postal_code) }
      it { is_expected.to respond_to(:province) }
      it { is_expected.to respond_to(:state) }
      it { is_expected.to respond_to(:type) }
      it { is_expected.to respond_to(:unparsed_address) }
    end
  end
end
