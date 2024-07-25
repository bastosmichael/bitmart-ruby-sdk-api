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
- Supports Spot, Contract, and Account operations

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

## Configuration

Before using the BitMart API, you need to set up your API keys. You can obtain these from your BitMart account.

```ruby
api_key = 'your_api_key'
api_secret = 'your_api_secret'
api_memo = 'your_api_memo'
```

## Usage

Here's an example of using the Spot API:

```ruby
require 'bitmart'

spot = Bitmart::API::V1::Spot.new(api_key, api_secret, api_memo)

# Get all currencies
currencies = spot.get_currencies

# Get user's wallet
wallet = spot.get_wallet

# Place a limit buy order
symbol = 'BTC_USDT'
size = '0.1'
price = '30000'
response = spot.post_submit_limit_buy_order(symbol, size, price)
```

## API Modules

### Account

The Account module provides methods for managing your BitMart account, including:

- Getting account currencies
- Retrieving wallet information
- Managing deposits and withdrawals

### Contract

The Contract module offers functionality for futures trading, including:

- Retrieving contract information
- Managing positions
- Placing and canceling orders

### Spot

The Spot module provides methods for spot trading, including:

- Getting market data (tickers, order books, etc.)
- Placing and canceling orders
- Retrieving user's orders and trades

### System

The System module offers general system-related methods:

- Getting system time
- Checking system status

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bastosmichael/bitmart/blob/master/CODE_OF_CONDUCT.md).

## Release Notes

### v0.1.3 (2021-12-10)
- Proof of concept Ruby gem build with working API endpoints.
- Added support for Spot, Contract, and Account API modules.
- Implemented system time and status methods.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
