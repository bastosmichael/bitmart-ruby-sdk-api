[![Logo](./logo.png)](https://bitmart.com)

# BitMart-Ruby-SDK-API

Ruby client for the [BitMart Cloud API](http://developer-pro.bitmart.com).

## Feature

- Provides exchange quick trading API
- Easier withdrawal
- Efficiency, higher speeds, and lower latencies
- Dedicated and responsive technical support
- Comprehensive API coverage (Spot, Contract, Account)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitmart'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bitmart

## Usage

Here's an example of using the Spot API:

```ruby
require "bitmart"

spot = Bitmart::API::V1::Spot.new("api_key")
currencies = spot.get_currencies
my_wallet = spot.get_wallet
```

And an example of using the Contract API:

```ruby
contract = Bitmart::API::V1::Contract.new("api_key")
contracts = contract.get_contracts
tickers = contract.get_tickers
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart.

## Release Notes

**2021-12-10 (v0.1.3)**
- Added Contract API support
- Implemented Account API
- Enhanced error handling and request signing
- Improved documentation and examples
- Refactored code for better maintainability

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
