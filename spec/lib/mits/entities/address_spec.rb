require 'spec_helper'

module MITS
  describe Address do
    it { is_expected.to respond_to(:address1) }
    it { is_expected.to respond_to(:address2) }
    it { is_expected.to respond_to(:city) }
    it { is_expected.to respond_to(:country) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:latitude) }
    it { is_expected.to respond_to(:longitude) }
    it { is_expected.to respond_to(:postal_code) }
    it { is_expected.to respond_to(:state) }
    it { is_expected.to respond_to(:type) }
  end
end
