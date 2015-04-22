module MITS
  class Document
    attr_reader :mapper, :parser

    DEFAULT_VERSION = '4.1'

    def initialize(url, opts = {})
      @mapper = load_versioned_mapper(opts[:version])
      @parser = ::Saxerator.parser(open(url)) do |c|
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
        yield mapper.company(tag)
      end
    end

    private

    def physical_property
      parser.within(:PhysicalProperty)
    end

    def load_versioned_mapper(version)
      version = DEFAULT_VERSION unless version
      Versions.for(:mapper).select(version.to_s)
    end

  end
end
