# Haikunator

[![Gem Version](https://badge.fury.io/rb/haikunator.svg)](http://badge.fury.io/rb/haikunator)

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

1. Fork it ( https://github.com/[my-github-username]/haikunator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
