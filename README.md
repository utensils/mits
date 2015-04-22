# MITS

A SAX powered reader for [Multifamily Information and Transactions Standard \(MITS\)](http://www.mitsproject.org/) compatible documents.

Currently supporting MITS __3.0__ & __4.1__ (default).

[![Gem Version](https://badge.fury.io/rb/mits.png)](https://rubygems.org/gems/mits) [![Build Status](https://travis-ci.org/doomspork/mits.svg?branch=master)](https://travis-ci.org/doomspork/mits) [![Code Climate](https://codeclimate.com/github/doomspork/mits/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mits) [![Coverage Status](https://coveralls.io/repos/doomspork/mits/badge.png?branch=master)](https://coveralls.io/r/doomspork/mits?branch=master) [![Dependency Status](https://gemnasium.com/doomspork/mits.svg)](https://gemnasium.com/doomspork/mits)

## Installation

	gem install mits

## Getting Started

Create a `MITS::Document` with a local filepath or URL:

```ruby
document = MITS::Document.new('/example/path/mits_compatible_feed.xml', version: 3.0)
```

Iterating over properties is easy:

```ruby
document.properties do |property|
  puts "#{property.name} now available online at #{property.website}"
end
```

The `#properties` method returns a `Enumerator` if no block is provided:

```ruby

document.properties.each_with_object([]) do |property, arr|
  # Only include properties with 2 or more units
  arr.push(property) if property.units.size > 2
end
```

## Contributing

Feedback, feature requests, and fixes are welcomed and encouraged.  Please make appropriate use of [Issues](https://github.com/doomspork/mits/issues) and [Pull Requests](https://github.com/doomspork/mits/pulls).  All code should have accompanying tests.

## Author

MITS is written and maintained by [@doomspork](http://github.com/doomspork) as part of [CityLeash.com](https://cityleash.com).

## License

Please see [LICENSE](https://github.com/doomspork/mits/blob/master/LICENSE) for licensing details.
