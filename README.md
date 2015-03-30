# MagicLocales

Rails gem to help with translations and locale changing. 
Uses simple locale style like **`:en`** or **`:de`** .. more complex (**`en-US`**) style may follow. 

The gem includes a seed file with most common european locales. 


## Usage
- add gem to your gemfile 
```ruby
  gem "magic_locales"
```

- run install generator
```ruby
  rails g magic_locales:install
```

- check new migration and migrate your database
```ruby
  bundle exec rake db:migrate
```


### Controller-Helper
- in your application controller: 
```ruby

  include MagicLocaleHelper

  before_action :get_user_language

```

`include MagicLocaleHelper` loads in the helper and `before_action :get_user_language` checks user language *(via db-field or accept-language)* .. now you can access your users `@accept_language`.




#### License
This project rocks and uses MIT-LICENSE.