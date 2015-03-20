require 'spec_helper'

module MITS
  describe Amenity do
    it { is_expected.to respond_to(:type) }
    it { is_expected.to respond_to(:description) }
  end
end
