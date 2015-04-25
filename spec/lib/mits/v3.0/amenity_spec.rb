require 'spec_helper'
require 'mits/v3.0/amenity'

module MITS
  module V3_0
    describe Amenity do
      it { is_expected.to respond_to(:description) }
      it { is_expected.to respond_to(:rank) }
      it { is_expected.to respond_to(:subtype) }
      it { is_expected.to respond_to(:type) }
    end
  end
end
