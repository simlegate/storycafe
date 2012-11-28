source 'http://ruby.taobao.org'


group :assets do
  gem 'sass-rails',   '~> 3.2.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
  gem 'uglifier', '>= 1.0.3'
end


gem 'rails', '3.2.8'
gem 'devise'



group :development,:test do
  gem "rspec"
  gem "rspec-rails", "2.9.0"
end


group :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'capybara'
end

gem 'mongoid'
gem 'bson_ext'
gem 'mongoid_auto_inc',:path => "lib/mongoid_auto_inc"
gem 'mongoid_rails_migrations'

gem "slim"
gem 'slim-rails'

gem 'jquery-rails'

# message push
gem "private_pub"

gem "thin"
