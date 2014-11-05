# Gem for wykop.pl API

This is a Ruby Gem for the Wykop.pl API. It should simplify the process of consuming data from the Wykop.pl API for developers using Ruby.


### Heads up

Until version 0.9+ gem will and should be considered as 'under heavy development'. Please be aware and don't bitch too much. 
Current gem version: [![Gem Version](https://badge.fury.io/rb/wykop.svg)](http://badge.fury.io/rb/wykop)

If you'd like to contribute - I'm really happy with your pull requests so feel free!

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



### Documentation

* [Read the f** doc](https://github.com/lukaszraczylo/wykop-ruby/tree/master/doc/index.md)

### Usage

##### Basic usage
The gem uses a client model to query against the API. To create and configure client with your API keys and make requests through that add the following:

```
require 'wykop'
client = Wykop::Client.new( { app_user_key: WYKOP_DEV_APP_KEY, app_user_secret: WYKOP_DEV_APP_SECRET, 
								app_generated_key: WYKOP_DEV_APP_GENERATED_KEY, app_username: WYKOP_USERNAME, api_host: 'http://a.wykop.pl' })
```