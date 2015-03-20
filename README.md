# MITS

A SAX powered Multifamily Information and Transactions Standard (MITS) reader.

[![Gem Version](https://badge.fury.io/rb/mits.png)](https://rubygems.org/gems/mits) [![Build Status](https://travis-ci.org/doomspork/mits.svg?branch=master)](https://travis-ci.org/doomspork/mits) [![Code Climate](https://codeclimate.com/github/doomspork/mits/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mits) [![Coverage Status](https://coveralls.io/repos/doomspork/mits/badge.png?branch=master)](https://coveralls.io/r/doomspork/mits?branch=master) [![Dependency Status](https://gemnasium.com/doomspork/mits.svg)](https://gemnasium.com/doomspork/mits)

## Installation

Add this line to your application's Gemfile:

	gem 'mits'

And require it:

	require 'mits'

## Usage

```ruby
MITS::Reader(file_path, version: 4.0) do |property|

end
```

## Contributing

Feedback and fixes are always welcome.  Please make use of [Issues](https://github.com/doomspork/mits/issues) and [Pull Requests](https://github.com/doomspork/mits/pulls), all code should have test coverage.

## Author/Contact

MITS is written and maintained by [@doomspork](http://github.com/doomspork).

## License

MITS is made available under the [MIT](http://opensource.org/licenses/MIT) License.
