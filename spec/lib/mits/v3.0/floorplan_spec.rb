require 'spec_helper'
require 'mits/v3.0/floorplan'

module MITS
  module V3_0
    describe Floorplan do
      it { is_expected.to respond_to(:bathrooms) }
      it { is_expected.to respond_to(:bedrooms) }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:rent) }
      it { is_expected.to respond_to(:sqft) }
    end
  end
end
