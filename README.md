[![Logo](./logo.png)](https://bitmart.com)

# BitMart-Ruby-SDK-API

Ruby client for the [BitMart Cloud API](http://developer-pro.bitmart.com).

## Features

- Provides exchange quick trading API
- Easier withdrawal
- Efficiency, higher speeds, and lower latencies
- Priority in development and maintenance
- Dedicated and responsive technical support
- Provide WebSocket API calls
- Spot, Contract, and Account API support

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

# Initialize the Spot API client
spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_sign", "your_api_memo")

# Get all currencies
currencies = spot.get_currencies

# Get user's wallet
wallet = spot.get_wallet

# Get symbol ticker
btc_usdt_ticker = spot.get_symbol_ticker("BTC_USDT")

# Place a limit buy order
order = spot.post_submit_limit_buy_order("BTC_USDT", "0.001", "30000")

# Get user's orders
orders = spot.get_user_orders("BTC_USDT", 0, 100, "active")
```

## API Modules

- `Bitmart::API::V1::Spot`: Spot trading API
- `Bitmart::API::V1::Contract`: Contract trading API
- `Bitmart::API::V1::Account`: Account management API
- `Bitmart::API::System`: System-related API

Each module provides various methods to interact with different aspects of the BitMart exchange.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart.

## Release Notes

**2021-12-10**
- Proof of concept Ruby gem build with working API endpoints.

**2023-06-14**
- Added support for Contract and Account API
- Improved error handling and request signing
- Updated to latest BitMart API endpoints
- Refactored code for better maintainability

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
