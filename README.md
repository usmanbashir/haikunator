# Haikunator

[![Gem Version](https://badge.fury.io/rb/haikunator.svg)](http://badge.fury.io/rb/haikunator)
[![Build Status](https://travis-ci.org/usmanbashir/haikunator.svg?branch=master)](https://travis-ci.org/usmanbashir/haikunator)
[![Coverage Status](https://coveralls.io/repos/usmanbashir/haikunator/badge.svg)](https://coveralls.io/r/usmanbashir/haikunator)

Generate Heroku-like memorable random names to use in your apps or anywhere else.

## Installation

Add this line to your application's Gemfile:

    gem 'haikunator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haikunator

## Usage

Haikunator is pretty simple. There is nothing to configure and it only has a single method, `.haikunate`:

```ruby
Haikunator.haikunate # => "rough-snowflake-1142"

# Token range
Haikunator.haikunate(100) # => "nameless-star-13"

# Don't include the token
Haikunator.haikunate(0) # => "long-flower"

# Use a different delimiter
Haikunator.haikunate(9999, '.') # => "cool.leaf.6743"

# No token, no delimiter
Haikunator.haikunate(0, ' ') # => "green fire"
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/usmanbashir/haikunator/issues)
- Fix bugs and [submit pull requests](https://github.com/usmanbashir/haikunator/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

## Other Languages

Haikunator is also available in other languages. Check them out:

- Node: https://github.com/AtroxDev/haikunatorjs
- Python: https://github.com/AtroxDev/haikunator
- Go: https://github.com/yelinaung/go-haikunator
