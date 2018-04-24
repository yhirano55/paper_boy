# PaperBoy

Automatically deliver notifications to subscribers from controllers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paper_boy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paper_boy

## Usage

At first, execute install command:

    $ bin/rails generate paper_boy:install

Include `PaperBoy` in `ApplicationController`:

```ruby
class ApplicationController < ActionController::Base
  include PaperBoy
end
```

And you generate subscriber class with generator command:

    $ bin/rails g paper_boy:subscriber

Then you implement subscriber class:

```ruby
class UsersSubscriber < ApplicationSubscriber
  def create(event)
    payload = event.payload

    # All instance variables are set from controller class.
    user = payload[:current_user]

    # implement something (mailer, slack notifier ...etc)
  end

  attach_to :"users"
end
```

## License

[MIT License](https://opensource.org/licenses/MIT)
