require 'open-uri'

module MITS
  class Reader
    attr_reader :parser

    def initialize(url)
      @parser = Saxerator.parse(open(url)) do |c|
        c.put_attributes_in_hash!
        c.symbolize_keys!
      end
    end

    def properties
      parser.for_tag(:property)
    end

    def companies
      parser.for_tag(:companies).within(:management)
    end
  end
end
