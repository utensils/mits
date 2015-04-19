require 'spec_helper'
require 'mits/v4.1/amenity'

module MITS
  module V4_1
    describe Amenity do
      it { is_expected.to respond_to(:type) }
      it { is_expected.to respond_to(:description) }
    end
  end
end
