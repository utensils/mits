require 'spec_helper'

module MITS
  describe Mapper do
    let(:address_tag) do
      {
        Type: 'other',
        Description: 'desc',
        AddressLine1: 'line1',
        AddressLine2: 'line2',
        City: 'city',
        State: 'state',
        PostalCode: 94611,
        Country: 'US'
      }
    end

    describe '.company' do
      let(:tag) do
        {
          Identification: {
            IDValue: 'id value',
            IDType: 'id type'
          },
          CompanyName: 'name',
          Address: address_tag,
          Website: 'http://...',
          Logo: 'http://...',
        }
      end

      subject { Mapper.company(tag) }

      it { is_expected.to be_a Company }
    end

    describe '.address' do
      subject { Mapper.address(address_tag) }

      it { is_expected.to be_a Address }
    end
  end
end
