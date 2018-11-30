# CircleCli

## Installation

This gem is not yet published to RubyGems. To add it as a dependency, add this line to your application's Gemfile:

```ruby
gem 'circle-cli', git: 'https://github.com/kickstarter/circle-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install circle-cli

## Usage

Setup:
  1. Generate a CircleCI token: https://circleci.com/account/api
  2. Store it as an environment variable `export CIRCLE_CI_TOKEN=<YOUR_CIRLCE_CI_TOKEN>`, or pass it in as an option `--token`

Usage:

    $ bundle exec circlecli <COMMAND> --token <YOUR_CIRLCE_CI_TOKEN>

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb` and push to github.

For now, this gem will remain in this github repository. Once it has been battle tested, we may consider publishing it to RubyGems. To do this, we would run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Acknowledgements

Huge thanks to Philippe Creux (@pcreux) for doing all the initial groundwork getting this CLI working!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kickstarter/circle-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CircleCli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/circle-cli/blob/master/CODE_OF_CONDUCT.md).
