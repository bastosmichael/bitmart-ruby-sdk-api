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

Here are some examples of using the BitMart Ruby SDK:

### Spot API Example

```ruby
spot = Bitmart::API::V1::Spot.new("your_api_key")
currencies = spot.get_currencies
wallet = spot.get_wallet
symbol_ticker = spot.get_symbol_ticker("BTC_USDT")
order = spot.post_submit_limit_buy_order("BTC_USDT", "0.1", "30000")
```

### Contract API Example

```ruby
contract = Bitmart::API::V1::Contract.new("your_api_key")
contracts = contract.get_contracts
tickers = contract.get_tickers
depth = contract.get_depth("BTCUSDT")
user_positions = contract.get_user_positions("BTCUSDT")
order = contract.post_submit_order("BTCUSDT", "1", "1", "0", "10", "custom_id", "30000", "1")
```

### Account API Example

```ruby
account = Bitmart::API::V1::Account.new("your_api_key")
currencies = account.get_currencies
wallet = account.get_wallet("1")
deposit_address = account.get_deposit_address("BTC")
withdraw_charge = account.get_withdraw_charge("BTC")
withdraw = account.post_withdraw_apply("BTC", "0.1", "1", "btc_address", "memo")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart-ruby-sdk-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Release Notes

### v0.1.3 (2021-12-10)
- Proof of concept Ruby gem build with working API endpoints
- Added support for Spot, Contract, and Account API modules
- Implemented system time and service endpoints

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
