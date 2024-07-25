[![Logo](./logo.png)](https://bitmart.com)

# BitMart-Ruby-SDK-API

Ruby client for the [BitMart Cloud API](http://developer-pro.bitmart.com).

## Features

- Provides exchange quick trading API
- Easier withdrawal
- Efficiency, higher speeds, and lower latencies
- Priority in development and maintenance
- Dedicated and responsive technical support
- Provides WebSocket API calls
- Supports Spot, Contract, and System API endpoints
- Implements Account management functionalities

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

Here are some examples of how to use the BitMart Ruby SDK:

### System API Example

```ruby
require "bitmart"

system_api = Bitmart::API::System.new

# Get system time
system_time = system_api.get_system_time
puts system_time

# Get system service status
system_service = system_api.get_system_service
puts system_service
```

### Spot API Example

```ruby
require "bitmart"

spot_api = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_memo")

# Get currencies
currencies = spot_api.get_currencies
puts currencies

# Get symbols
symbols = spot_api.get_symbols
puts symbols

# Place a limit buy order
order = spot_api.post_submit_limit_buy_order("BTC_USDT", "0.01", "30000")
puts order
```

### Contract API Example

```ruby
require "bitmart"

contract_api = Bitmart::API::V1::Contract.new("your_api_key", "your_api_secret", "your_memo")

# Get contracts
contracts = contract_api.get_contracts
puts contracts

# Get contract tickers
tickers = contract_api.get_tickers("BTCUSDT")
puts tickers
```

### Account API Example

```ruby
require "bitmart"

account_api = Bitmart::API::V1::Account.new("your_api_key", "your_api_secret", "your_memo")

# Get wallet balances
wallet = account_api.get_wallet("spot")
puts wallet

# Get deposit address
deposit_address = account_api.get_deposit_address("BTC")
puts deposit_address
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Release Notes

### 2021-12-10
- Proof of concept Ruby gem build with working API endpoints.

### 2023-05-24
- Added support for Contract API endpoints
- Implemented Account API functionality
- Enhanced error handling and request signing
- Updated documentation and usage examples

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
