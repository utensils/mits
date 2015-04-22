require 'open-uri'
require 'saxerator'
require 'simple_objects'
require 'versions'

require 'mits/base_mapper'
require 'mits/document'
require 'mits/saxerator_ext'
require 'mits/version'

module MITS
  Versions.config.base_dir = File.join(File.realpath(__dir__), 'mits')
  Versions.config.class_prefix = 'MITS::V'
end
