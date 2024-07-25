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
- Supports spot trading, contract trading, and account management

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

Replace the API key, secret, and memo with your own credentials.

### Spot Trading Example

```ruby
require "bitmart"

spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_api_memo")

# Get all currencies
currencies = spot.get_currencies

# Get wallet information
wallet = spot.get_wallet

# Place a limit buy order
symbol = "BTC_USDT"
size = "0.1"
price = "30000"
response = spot.post_submit_limit_buy_order(symbol, size, price)

# Get order details
order_id = response["data"]["order_id"]
order_details = spot.get_user_order_detail(symbol, order_id)

# Cancel an order
spot.post_cancel_order(symbol, order_id)
```

### Contract Trading Example

```ruby
require "bitmart"

contract = Bitmart::API::V1::Contract.new("your_api_key", "your_api_secret", "your_api_memo")

# Get all contracts
contracts = contract.get_contracts

# Get contract tickers
tickers = contract.get_tickers

# Place a contract order
contract_id = "BTCUSDT"
category = 1
way = 1
open_type = 1
leverage = 10
custom_id = "my_custom_id"
price = "30000"
vol = "1"
response = contract.post_submit_order(contract_id, category, way, open_type, leverage, custom_id, price, vol)

# Get user positions
positions = contract.get_user_positions(contract_id)
```

### Account Management Example

```ruby
require "bitmart"

account = Bitmart::API::V1::Account.new("your_api_key", "your_api_secret", "your_api_memo")

# Get account balance
balance = account.get_wallet("spot")

# Get deposit address
currency = "BTC"
deposit_address = account.get_deposit_address(currency)

# Withdraw funds
amount = "0.1"
destination = "2"
address = "1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2"
address_memo = ""
withdraw_response = account.post_withdraw_apply(currency, amount, destination, address, address_memo)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Release Notes

### 0.1.3 (2021-12-10)
- Proof of concept Ruby gem build with working API endpoints.

### 0.1.4 (Current)
- Added support for contract trading API
- Implemented account management API
- Improved error handling and documentation
- Updated usage examples in README

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
