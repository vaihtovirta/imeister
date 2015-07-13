# Imeister

Tiny gem for fetching information about Apple Phones' warranty by imei

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imeister'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install imeister

## Usage
```ruby
imeister = Imeister.find(VALID_IMEI)
#=> #<Imeister::WarrantyStatus:0x007fb627c18150 @expiration_date="May 18, 2099", @imei=VALID_IMEI, @warranty_status="In warranty">
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

