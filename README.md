## Quick start guide

```ruby
  gem install local_uri
```

or add it to your Gemfile:

```ruby
  gem 'local_uri'
```

Replace ruby core URI with `LocalUri::URI`.

In plain ruby:
```ruby
define_method(:URI, ->(string) { LocalUri::URI.new(string) })
```

In rails:
```ruby
# config/initalizers/uri.rb

define_method(:URI, ->(string) { LocalUri::URI.new(string) })
```

If you already have code in place that uses ruby core `URI` you can skip the replacement and just use `LocalUri::URI` directly:

```ruby
LocalUri::URI.new('https://local.ch')
```

## Working with URIs

`LocalUri::URI` has the following capabilities:

### Queries

#### Merge hashes into url queries

`merge(hash)` - returns a copy of the base LocalUri::URI with given hash being merged into the query params:

```ruby

uri = URI('https://yellow.local.ch/d/abc')
uri.to_s # https://yellow.local.ch/d/abc

uri.query.merge(tracking_id: 123).to_s # https://yellow.local.ch/d/abc?tracking_id=123
```

If you place those urls directly in the view or api response, an explicit to_s is not necessary:

```ruby

%a{href: URI('https://yellow.local.ch/d/abc').query.merge(tracking_id: 123)} # <a href="https://yellow.local.ch/d/abc?tracking_id=123"/>

```

`merge!(hash)` - the same as `merge` but changes the original URI.

`merge(hash)` and `merge!(hash)` also support nested query:

```ruby

uri = URI('https://booking-widget.local.ch/entries/abc/bookings/new')
uri.query.merge(booking: { people: 2 }).to_s # https://booking-widget.local.ch/entries/abc/bookings/new?booking[people]=2
```

#### Access data in queries

```ruby

uri = URI('https://local.ch?id=1&place[name]=casa')
uri[:id] # '1'
uri.dig(:place, :name) # 'casa'
```
