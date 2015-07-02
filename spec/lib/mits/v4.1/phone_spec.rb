require 'spec_helper'
require 'mits/v4.1/phone'

module MITS
  module V3_0
    describe Phone do
      it { is_expected.to respond_to(:extension) }
      it { is_expected.to respond_to(:number) }
      it { is_expected.to respond_to(:type) }
    end
  end
end
