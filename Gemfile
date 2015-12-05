source "https://rubygems.org"

gem "rails", "4.2.4"
gem "pg"
gem "bootstrap-sass"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "nokogiri"
gem "puma"

group :development, :test do
  gem "byebug"
  gem "rubocop"
  gem "sandi_meter"
end

group :development do
  gem "web-console", "~> 2.0"
  gem "spring"

  gem "capistrano"
  gem "capistrano-rbenv"
  gem "capistrano-rails",   require: false
  gem "capistrano-bundler", require: false
  gem "capistrano3-puma",   require: false
end

group :production do
  gem "rails_12factor"
end
