require 'spec_helper'

module MITS
  describe File do
    it { is_expected.to respond_to(:active) }
    it { is_expected.to respond_to(:caption) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:format) }
    it { is_expected.to respond_to(:height) }
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:rank) }
    it { is_expected.to respond_to(:source) }
    it { is_expected.to respond_to(:width) }
  end
end

