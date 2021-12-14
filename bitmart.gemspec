require_relative 'lib/bitmart/version'

Gem::Specification.new do |spec|
  spec.name          = "bitmart"
  spec.version       = Bitmart::VERSION
  spec.authors       = ["Michael Bastos"]
  spec.email         = ["bastosmichael@gmail.com"]

  spec.summary       = "Ruby client for the BitMart API"
  spec.description   = "Ruby client for the BitMart Cloud API - http://developer-pro.bitmart.com. Features include Providing exchange quick trading API, Easier withdrawal, Efficiency, higher speeds, and lower latencies, Priority in development and maintenance, Dedicated and responsive technical support & Provide webSocket apis calls"
  spec.homepage      = "https://github.com/bastosmichael/bitmart-ruby-sdk-api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bastosmichael/bitmart-ruby-sdk-api"
  spec.metadata["changelog_uri"] = "https://github.com/bastosmichael/bitmart-ruby-sdk-api"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
