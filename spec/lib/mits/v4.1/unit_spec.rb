require 'spec_helper'
require 'mits/v4.1/unit'

module MITS
  module V4_1
    describe Unit do
      it { is_expected.to respond_to(:bathrooms) }
      it { is_expected.to respond_to(:bedrooms) }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:rent) }
      it { is_expected.to respond_to(:sqft) }
    end
  end
end
