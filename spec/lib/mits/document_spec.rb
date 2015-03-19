require 'spec_helper'

module MITS
  describe Document do
    subject { Document.new('./spec/fixtures/mits.xml') }

    describe '#properties' do
      it 'will return the properties' do
        companies = subject.properties.reduce([]) { |arr, property| arr.push(property) }
        expect(companies.first).to be_a Property
        expect(companies.size).to eq 2
      end
    end

    describe '#companies' do
      it 'will return the companies' do
        companies = subject.companies.reduce([]) { |arr, company| arr.push(company) }
        expect(companies.first).to be_a Company
        expect(companies.size).to eq 1
      end
    end
  end
end
