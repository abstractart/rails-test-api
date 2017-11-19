# README

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

## Configuration

`rvm gemset create httplab-rails-api && bundle install && rails db:setup && yarn`

## Linters (code analyzers)

```bash
chmod +x linters.sh
./linters.sh
```