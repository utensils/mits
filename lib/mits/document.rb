module MITS
  class Document
    attr_reader :parser, :version

    DEFAULT_VERSION = '4.1'

    def initialize(url, opts = {})
      @version = (opts[:version] || DEFAULT_VERSION).to_s
      @parser  = ::Saxerator.parser(open(url)) do |c|
        c.put_attributes_in_hash!
        c.symbolize_keys!
      end
    end

    def properties
      return enum_for(:properties) unless block_given?

      physical_property.for_tag(:Property).each do |tag|
        yield mapper.property(tag)
      end
    end

    def companies
      return enum_for(:companies) unless block_given?

      physical_property.within(:Management).within(:PropertyContacts).each do |tag|
        yield mapper.company(tag, company_entity)
      end
    end

    private

    def company_entity
      Versions.for(:company).select(version)
    end

    def physical_property
      parser.within(:PhysicalProperty)
    end

    def mapper
      @mapper ||= Versions.for(:mapper).select(version)
    end

  end
end
