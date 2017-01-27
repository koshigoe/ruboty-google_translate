# Ruboty::GoogleTranslate

Ruboty plugin to translate text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-google_translate'
```

And then execute:

    $ bundle

## Usage

```
ruboty 英語で <text>      - Translate text to English
ruboty in japanese <text> - Translate text to Japanese
```

## ENV

```
GOOGLE_CLOUD_KEY     - Google Cloud Project ID
GOOGLE_CLOUD_PROJECT - Google Cloud API Key
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koshigoe/ruboty-google_translate.

