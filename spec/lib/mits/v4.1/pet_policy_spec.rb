require 'spec_helper'

module MITS
  module V4_1
    describe PetPolicy do
      it { is_expected.to respond_to(:allowed) }
      it { is_expected.to respond_to(:allowed?) }
      it { is_expected.to respond_to(:care) }
      it { is_expected.to respond_to(:deposit) }
      it { is_expected.to respond_to(:fee) }
      it { is_expected.to respond_to(:pets) }
      it { is_expected.to respond_to(:rent) }
      it { is_expected.to respond_to(:restrictions) }
    end
  end
end
