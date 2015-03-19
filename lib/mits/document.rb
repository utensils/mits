require 'open-uri'
require 'saxerator'

module MITS
  class Document
    attr_reader :parser

    def initialize(url)
      @parser = ::Saxerator.parser(open(url)) do |c|
        c.put_attributes_in_hash!
        c.symbolize_keys!
      end
    end

    def properties
      return enum_for(:properties) unless block_given?

      physical_property.for_tag(:Property).each do |tag|
        yield Mapper.property(tag)
      end
    end

    def companies
      return enum_for(:companies) unless block_given?

      physical_property.within(:Management).within(:PropertyContacts).each do |tag|
        yield Mapper.company(tag)
      end
    end

    private

    def physical_property
      parser.within(:PhysicalProperty)
    end

  end
end
