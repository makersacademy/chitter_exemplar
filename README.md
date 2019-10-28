# Chitter Challenge Exemplar

This is an exemplar for the [Chitter Challenge](https://github.com/makersacademy/chitter-challenge/).

## Prerequisites

- Ruby 2.6.5
- Postgres 11

## Get started

1. Clone this repository
1. Install gem bundle
    ```bash
    $ bundle install
    ```
1. Create databases for testing and local development
    ```bash
    $ createdb chitter_test
    $ createdb chitter_development
    ```
1. Run the tests
    ```bash
    $ bundle exec rspec
    ```
1. Start the web server
    ```bash
    $ bundle exec rackup
    ```
1. Use the web app in your browser at http://localhost:9292
