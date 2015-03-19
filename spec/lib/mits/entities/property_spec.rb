require 'spec_helper'

module MITS
  describe Property do
    it { is_expected.to respond_to(:deposit) }
    it { is_expected.to respond_to(:fees) }
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:units) }
    it { is_expected.to respond_to(:website) }
  end
end
