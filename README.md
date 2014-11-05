# Gem for wykop.pl API

This is a Ruby Gem for the Wykop.pl API. It should simplify the process of consuming data from the Wykop.pl API for developers using Ruby.

### Installation
Add following to your application Gemfile:

```
gem 'wykop', require: 'wykop'
```

And then execute:

```
$ bundle
```

Or install it on your own:

```
$ gem install wykop
```

### Usage

##### Basic usage
The gem uses a client model to query against the API. To create and configure client with your API keys and make requests through that add the following:

```
require 'wykop'
client = Wykop::Client.new( { consumer_key: YOUR_WYKOP_DEV_KEY, 
							  consumer_secret: YOUR_WYKOP_DEV_SECRET })
```