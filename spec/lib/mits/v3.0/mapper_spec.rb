require 'spec_helper'
require 'mits/v3.0/mapper'

module MITS
  module V3_0
    describe Mapper do
      let(:fixture) { YAML.load_file('./spec/fixtures/MITS_3.0_Property.yml') }

      describe '.address' do
        subject { Mapper.address(fixture[:PropertyID][:Address], fixture[:ILS_Identification]) }

        it { is_expected.to be_a Address }

        it 'include various amenities' do
          expect(subject.address).to eq '11401 Dr. Martin Luther King Jr. St N'
          expect(subject.city).to eq 'Saint Petersburg'
          expect(subject.state).to eq 'FL'
          expect(subject.email).to eq 'sales@camdenliving.com'
        end
      end

      describe '.amenities' do
        subject { Mapper.amenities(fixture[:Amenity]) }

        it { is_expected.to be_a Array }

        it 'include various amenities' do
          first = subject.first
          expect(first).to be_a Amenity
          expect(first.description).to eq 'Extra storage'
          expect(first.type).to eq 'Other'
        end
      end

      #
      #
      # TODO: VERIFY COMPANY
      #
      #
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

      describe '.deposits' do
        subject { Mapper.deposits(fixture[:Deposit]) }

        it { is_expected.to be_a Array }

        it 'include deposit details' do
          deposit = subject.first
          expect(deposit.amount).to eq 3000.00
          expect(deposit.description).to be_nil
          expect(deposit.type).to eq 'Security Deposit'
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

      describe '.files' do
        subject { Mapper.files(fixture[:File]) }

        it { is_expected.to be_a Array }

        it 'includes each file' do
          first = subject.first
          expect(first).to be_a File
          expect(first.source).to eq 'http://capi.myleasestar.com/v2/dimg/5719594/898x428/5719594.png'
        end
      end

      describe '.pets' do
        subject { Mapper.pets(fixture[:Policy][:Pet].first[:Pets]) }

        it { is_expected.to be_a Array }

        it 'includes each allowed pet' do
          first = subject.first
          expect(first).to be_a Pet
          expect(first.count).to eq 2
          expect(first.type).to eq 'Cat'
        end
      end

      describe '.pet_policies' do
        subject { Mapper.pet_policies(fixture[:Policy][:Pet]) }

        it { is_expected.to be_a Array}

        it 'includes details' do
          first = subject.first
          expect(first.allowed).to be_truthy
          expect(first.care).to be_truthy
          expect(first.fee).to eq 0.00
          expect(first.pets).to be_a Array
          expect(first.rent).to eq 0.00
        end

        context 'when no pets allowed' do
          before { fixture[:Policy][:Pet].first[:Allowed] = 'false' }

          it 'will reflect that' do
            expect(subject.first.allowed).to be_falsey
          end
        end
      end

      describe '.phones' do
        subject { Mapper.phones(fixture[:PropertyID][:Phone]) }

        it { is_expected.to be_a Array }

        it 'includes individual phone numbers' do
          first = subject.first

          expect(first.extension).to be_nil
          expect(first.number).to eq '727-577-7557'
          expect(first.type).to eq 'office'
        end
      end

      describe '.policy' do
        subject { Mapper.policy(fixture[:Policy]) }

        it { is_expected.to be_a Policy }

        it 'includes details' do
          expect(subject.general).to be_nil
          expect(subject.pet).to be_a Array
        end
      end

      describe '.property' do
        subject { Mapper.property(fixture) }

        it { is_expected.to be_a Property }

        it 'includes details' do
          expect(subject.address).to be_a Address
          expect(subject.amenities.size).to eq 11
          expect(subject.company_id).to eq '6890047'
          expect(subject.deposit).to be_a Array
          expect(subject.description).to eq 'a very long description'
          expect(subject.fees).to be_a Fees
          expect(subject.files).to be_a Array
          expect(subject.id).to eq '89851'
          expect(subject.name).to eq 'Camden Lakes'
          expect(subject.phones).to be_a Array
          expect(subject.phones.first).to be_a Phone
          expect(subject.policy).to be_a Policy
          expect(subject.summary).to eq 'a short description'
          expect(subject.floorplans).to be_a Array
        end
      end

      describe '.floorplans' do
        subject { Mapper.floorplans(fixture[:Floorplan]) }

        it { is_expected.to be_a Array }

        it 'includes individual floorplans' do
          first = subject.first
          expect(first).to be_a Floorplan
          expect(first.bathrooms).to eq 1.0
          expect(first.bedrooms).to eq 1
          expect(first.name).to eq 'Keystone'
          expect(first.rent).to eq 779..979
          expect(first.sqft).to eq 600..615
        end
      end
    end
  end
end
