# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mits/version'

Gem::Specification.new do |spec|
  spec.name          = 'mits'
  spec.version       = MITS::VERSION
  spec.authors       = ['Sean Callan']
  spec.email         = ['seancallan@gmail.com']
  spec.summary       = 'A Multifamily Information and Transactions Standard (MITS) reader for Ruby.' 
  spec.description   = 'A SAX powered reader for Multifamily Information and Transactions Standard (MITS) files.'
  spec.homepage      = 'https://github.com/doomspork/mits'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'simple_objects',  '~> 1.1'
  spec.add_dependency 'saxerator',       '~> 0.9.5'
  spec.add_dependency 'versions.rb',     '~> 1.0'

  spec.add_development_dependency 'bundler',     '~> 1.7'
  spec.add_development_dependency 'coveralls',   '~> 0.7'
  spec.add_development_dependency 'pry',         '~> 0.10'
  spec.add_development_dependency 'pry-byebug',  '~> 2.0'
  spec.add_development_dependency 'rake',        '~> 10.0'
  spec.add_development_dependency 'rspec',       '~> 3.1'
  spec.add_development_dependency 'simplecov',   '~> 0.9'
end
