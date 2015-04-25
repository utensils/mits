require 'spec_helper'
require 'mits/v3.0/pet_policy'

module MITS
  module V3_0
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
