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
- Supports Spot, Contract, Account, and System API endpoints

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitmart'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install bitmart
```

## Usage

Here are some examples of how to use the BitMart Ruby SDK:

### Spot API Example

```ruby
require "bitmart"

spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_memo")

# Get all currencies
currencies = spot.get_currencies

# Get user's wallet
wallet = spot.get_wallet

# Place a limit buy order
order = spot.post_submit_limit_buy_order("BTC_USDT", "0.1", "30000")

# Get order details
order_details = spot.get_user_order_detail("BTC_USDT", order["data"]["order_id"])
```

### Contract API Example

```ruby
contract = Bitmart::API::V1::Contract.new("your_api_key", "your_api_secret", "your_memo")

# Get all contracts
contracts = contract.get_contracts

# Get user's positions
positions = contract.get_user_positions("BTCUSDT")
```

### Account API Example

```ruby
account = Bitmart::API::V1::Account.new("your_api_key", "your_api_secret", "your_memo")

# Get deposit address
deposit_address = account.get_deposit_address("BTC")

# Get deposit-withdraw history
history = account.get_deposit_withdraw_history("BTC", "deposit", 0, 10)
```

### System API Example

```ruby
system = Bitmart::API::System.new

# Get system time
system_time = system.get_system_time

# Get system service status
system_service = system.get_system_service
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart-ruby-sdk-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Release Notes

### v0.1.3 (2021-12-10)
- Proof of concept Ruby gem build with working API endpoints.

### v0.1.4 (Latest)
- Added Contract API support
- Added Account API support
- Added System API support
- Improved error handling and documentation

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
