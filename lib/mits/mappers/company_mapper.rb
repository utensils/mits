module MITS
  module CompanyMapper
    def company(tag)
      Company.new(address: address(tag[:Address]),
                  id:      tag[:Identification][:IDValue],
                  logo:    tag[:Logo],
                  name:    tag[:CompanyName],
                  website: tag[:Website])
    end
  end
end
