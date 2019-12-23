# Mshauri
This README would normally document whatever steps are necessary to get the
application up and running.


## Reqirements

- Ruby 2.3.0 or newer
- Rails 6.0.1 or newer

## Installation

The project uses [rubocop](https://github.com/rubocop-hq/rubocop) for code linting.


## Usage

The project uses [eslitn](https://github.com/eslint/eslint) for code linting.

```bash
node_modules/.bin/eslint --ext .js,.vue app/javascript/ --fix # auto fix
```

The project uses [rubocop](https://github.com/rubocop-hq/rubocop) for code linting.
```rb
bundle exec rubocop
bundle exec rubocop -a # auto fix
```


## Contributing

Automated tests: We use rspec to test. Simply run `rake` to execute the whole test suite.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
