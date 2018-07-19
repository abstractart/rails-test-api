# README
[![Build Status](https://travis-ci.org/abstractart/rails-test-api.svg?branch=master)](https://travis-ci.org/abstractart/rails-test-api)
## Task
[task.md](task.md)

## API Specification

[Docs](api_doc.md)

## Environment

I prefer to use RVM.

### Ruby version

RVM creates gemset based on `.ruby-version` and `.ruby-gemset`: `2.4.2@httplab-rails-api`.

* Ruby 2.4.2
* Rails 5.1.4

## Dependencies

* PostgreSQL 9.4+
* ElasticSearch 5

## Configuration

`rvm gemset create httplab-rails-api && bundle --without production && rails db:setup && yarn`

## Linters (code analyzers)

```bash
chmod +x linters.sh
./linters.sh
```
