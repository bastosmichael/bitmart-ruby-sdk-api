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
- Comprehensive API coverage (System, Account, Spot, and Contract)

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

### API Examples

#### System API

```ruby
system = Bitmart::API::System.new

# Get system time
system_time = system.get_system_time

# Get system service status
service_status = system.get_system_service
```

#### Account API

```ruby
account = Bitmart::API::V1::Account.new("your_api_key", "your_api_secret", "your_memo")

# Get wallet
wallet = account.get_wallet("spot")

# Get deposit address
deposit_address = account.get_deposit_address("BTC")

# Apply for withdrawal
withdrawal = account.post_withdraw_apply("BTC", "0.1", "1", "btc_address", "memo")
```

#### Spot API

```ruby
spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_memo")

# Get currencies
currencies = spot.get_currencies

# Get ticker
ticker = spot.get_ticker

# Submit a limit buy order
order = spot.post_submit_limit_buy_order("BTC_USDT", "0.01", "30000")

# Get user's orders
orders = spot.get_user_orders("BTC_USDT", 1, 10, "1")
```

#### Contract API

```ruby
contract = Bitmart::API::V1::Contract.new("your_api_key", "your_api_secret", "your_memo")

# Get contracts
contracts = contract.get_contracts

# Get tickers
tickers = contract.get_tickers

# Submit an order
order = contract.post_submit_order("BTC_USDT", "1", "1", "1", "10", "custom_id", "30000", "0.01")

# Get user's positions
positions = contract.get_user_positions("BTC_USDT")
```

## API Documentation

### System API

The System API provides methods to retrieve system-related information:

- `get_system_time`: Get the current system time
- `get_system_service`: Get the system service status

### Account API

The Account API allows you to manage your account and perform account-related operations:

- `get_currencies`: Get a list of supported currencies
- `get_wallet`: Get wallet balance
- `get_deposit_address`: Get deposit address for a specific currency
- `get_withdraw_charge`: Get withdrawal fee for a specific currency
- `post_withdraw_apply`: Apply for withdrawal
- `get_deposit_withdraw_history`: Get deposit and withdrawal history
- `get_deposit_withdraw_detail`: Get details of a specific deposit or withdrawal

### Spot API

The Spot API provides methods for spot trading and market data:

- `get_currencies`: Get a list of supported currencies
- `get_symbols`: Get a list of supported trading pairs
- `get_ticker`: Get ticker information
- `get_symbol_kline`: Get K-line (candlestick) data for a symbol
- `post_submit_limit_buy_order`: Submit a limit buy order
- `post_submit_limit_sell_order`: Submit a limit sell order
- `post_submit_market_buy_order`: Submit a market buy order
- `post_submit_market_sell_order`: Submit a market sell order
- `get_user_orders`: Get user's orders
- `get_user_order_trades`: Get trades for a specific order

### Contract API

The Contract API provides methods for futures contract trading:

- `get_contracts`: Get a list of supported contracts
- `get_tickers`: Get ticker information for contracts
- `get_depth`: Get order book depth
- `post_submit_order`: Submit an order
- `get_user_positions`: Get user's positions
- `get_user_trades`: Get user's trade history
- `get_funding_rate`: Get funding rate for a contract

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart-ruby-sdk-api.

## Release Notes

### v0.1.3 (2021-12-10)
- Proof of concept Ruby gem build with working API endpoints.

### v0.1.4 (Latest)
- Added comprehensive API coverage (System, Account, Spot, and Contract)
- Improved documentation and usage examples
- Enhanced error handling and code structure

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
