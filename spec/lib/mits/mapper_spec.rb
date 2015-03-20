require 'spec_helper'

module MITS
  describe Mapper do
    let(:fixture) { YAML.load_file('./spec/fixtures/property.yml') }

    describe '.address' do
      subject { Mapper.address(fixture[:PropertyID][:Address]) }

      it { is_expected.to be_a Address }
    end

    describe '.amenities' do
      subject { Mapper.amenities(fixture[:ILS_Unit][:Amenity]) }

      it { is_expected.to be_a Array }

      it 'include various amenities' do
        first = subject.first
        expect(first).to be_a Amenity
        expect(first.description).to eq 'Refrigerator'
        expect(first.type).to eq 'Refrigerator'
      end
    end

    describe '.company' do
      let(:tag) do
        {
          Identification: {
            IDValue: 'id value',
            IDType: 'id type'
          },
          CompanyName: 'name',
          Address: fixture[:PropertyID][:Address],
          Website: 'http://...',
          Logo: 'http://...',
        }
      end

      subject { Mapper.company(tag) }

      it { is_expected.to be_a Company }
    end

    describe '.deposit' do
      subject { Mapper.deposit(fixture[:Deposit]) }

      it { is_expected.to be_a Deposit }

      it 'include deposit details' do
        expect(subject.amount).to eq 3000.00
        expect(subject.description).to be_nil
        expect(subject.type).to eq 'Security Deposit'
      end

      context 'when a range' do
        let(:ranged_deposit) do
          { Amount: { ValueRange: { Min: 100, Max: 1000 } } }
        end

        subject { Mapper.deposit(ranged_deposit) }

        it 'include deposit details' do
          expect(subject.amount).to eq 100..1000
        end
      end
    end

    describe '.fees' do
      subject { Mapper.fees(fixture[:Fee]) }

      it { is_expected.to be_a Fees }

      it 'include individual fee amounts' do
        expect(subject.admin_fee).to eq 0.0
        expect(subject.application_fee).to eq 50.0
        expect(subject.broker_fee).to eq 0.0
        expect(subject.late_fee_per_day).to eq 0.0
        expect(subject.late_min_fee).to eq 0.0
        expect(subject.late_percent).to eq 0.0
        expect(subject.late_type).to eq 'Standard'
        expect(subject.non_refundable_hold_fee).to eq 0.0
        expect(subject.prorate_type).to eq 'Standard'
      end
    end

    describe '.property' do
      subject { Mapper.property(fixture) }

      it { is_expected.to be_a Property }

      it 'includes details' do
        expect(subject.deposit).to be_a Deposit
        expect(subject.fees).to be_a Fees
        expect(subject.id).to eq 'SomethingRandom1'
        expect(subject.name).to eq 'Cool New Apartment!!!!'
        expect(subject.units).to be_a Array
        expect(subject.website).to eq 'http://harris.net/juwan'
      end
    end

    describe '.units' do
      subject { Mapper.units(fixture[:ILS_Unit][:Units][:Unit]) }

      it { is_expected.to be_a Array }

      it 'includes individual units' do
        first = subject.first
        expect(first).to be_a Unit
        expect(first.bathrooms).to eq 4.0
        expect(first.bedrooms).to eq 4.0
        expect(first.name).to eq 'Cool New Apartment!!!!'
        expect(first.rent).to eq 3400.0
        expect(first.sqft).to eq 3400..3400
      end
    end
  end
end
