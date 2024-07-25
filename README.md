[![Logo](./logo.png)](https://bitmart.com)

# BitMart-Ruby-SDK-API

Ruby client for the [BitMart Cloud API](http://developer-pro.bitmart.com).

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [API Example](#api-example)
- [Available APIs](#available-apis)
  - [System API](#system-api)
  - [Account API](#account-api)
  - [Spot API](#spot-api)
  - [Contract API](#contract-api)
- [Development](#development)
- [Contributing](#contributing)
- [Release Notes](#release-notes)
- [License](#license)

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
gem 'bitmart', '~> 0.1.3'
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

### API Example

```ruby
require "bitmart"

# Initialize Spot API client
spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_api_memo")

# Get all currencies
currencies = spot.get_currencies

# Get user's wallet
wallet = spot.get_wallet

# Get available currencies for deposit/withdrawal
available_currencies = currencies["data"]["currencies"].select do |c|
  c["withdraw_enabled"] == true || c["deposit_enabled"] == true
end

# Compare available currencies with user's wallet
new_currencies = available_currencies.reject do |coin|
  wallet["data"]["wallet"].any? { |w| w["id"] == coin["id"] }
end

puts "New available currencies: #{new_currencies.map { |c| c['id'] }.join(', ')}"
```

## Available APIs

### System API

```ruby
system_api = Bitmart::API::System.new

# Get system time
system_time = system_api.get_system_time

# Get system service status
system_service = system_api.get_system_service
```

### Account API

```ruby
account_api = Bitmart::API::V1::Account.new("your_api_key", "your_api_secret", "your_api_memo")

# Get account currencies
currencies = account_api.get_currencies

# Get account wallet
wallet = account_api.get_wallet("spot")

# Get deposit address
deposit_address = account_api.get_deposit_address("BTC")
```

### Spot API

```ruby
spot_api = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_api_memo")

# Get symbols
symbols = spot_api.get_symbols

# Get ticker
ticker = spot_api.get_ticker

# Submit a limit buy order
order = spot_api.post_submit_limit_buy_order("BTC_USDT", "0.01", "30000")
```

### Contract API

```ruby
contract_api = Bitmart::API::V1::Contract.new("your_api_key", "your_api_secret", "your_api_memo")

# Get contracts
contracts = contract_api.get_contracts

# Get contract tickers
tickers = contract_api.get_tickers

# Get user positions
positions = contract_api.get_user_positions("BTCUSDT")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart-ruby-sdk-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Release Notes

### 2021-12-10 (v0.1.0)
- Proof of concept Ruby gem build with working API endpoints.

### 2022-01-15 (v0.1.1)
- Added support for Contract API.
- Improved error handling and documentation.

### 2022-02-28 (v0.1.2)
- Added WebSocket support for real-time data.
- Implemented rate limiting to comply with API restrictions.

### 2022-04-10 (v0.1.3)
- Added support for new endpoints in Account and Spot APIs.
- Improved performance and reduced memory usage.
- Updated dependencies to address security vulnerabilities.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
