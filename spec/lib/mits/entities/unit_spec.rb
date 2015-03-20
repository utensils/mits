require 'spec_helper'

module MITS
  describe Unit do
    it { is_expected.to respond_to(:bathrooms) }
    it { is_expected.to respond_to(:bedrooms) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:rent) }
    it { is_expected.to respond_to(:sqft) }
  end
end
