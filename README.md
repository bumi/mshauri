# Mshauri

Mshauri is the questionnaire application used for [tech-guide.rw](https://www.tech-guide.rw/)

It's main features include: Collecting answers to certain questions and providing relevant answers/suggestions depending on the user's replies.

Currently it is used for "software engineering best practices", but the application can be used with any questions/content.

## Reqirements

- Ruby 2.3.0 or newer
- Rails
- Postgres
- all ruby dependencies are described in the Gemfile (please refer to the changelog of this file to check for updates)

## Installation

1) Install the bundle

    ```bash
    bundle install
    ```
2) Setup your database

    Edit your database configuration if required
    ```bash
    vim config/database.yml
     ```
   Create, migrate and seed the database. This also loads the question and reocmmendation content from `/data`
    ```bash
    rake db:setup
    ```

## Usage

1) Run the server
    ```bash
    rails server
    open http://localhost:3000
    ```


## Contributing

The project uses [eslitn](https://github.com/eslint/eslint) for code linting.

    ```bash
    node_modules/.bin/eslint --ext .js,.vue app/javascript/ --fix # auto fix
    ```

The project uses [rubocop](https://github.com/rubocop-hq/rubocop) for code linting.
    ```rb
    bundle exec rubocop
    bundle exec rubocop -a # auto fix
    ```

## Content

All content is structured in yml files and can be found in `/data`.

The data is loaded using the `rake db:seed` task which runs the `db/seeds.rb` file. The task can be run multiple times and will update existing data.

The questions and recommendations can be completely changed and used for different topics. Just make sure to respect the same structure in the YAML files. 


## Questions

Please let us know if you have questions or need any help: 

hello@michaelbumann.com
