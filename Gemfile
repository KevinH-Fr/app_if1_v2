source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.3"
gem "sprockets-rails"

#gem "sqlite3", "~> 1.4"
gem 'pg'

gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'tzinfo-data', '~> 1.2021', '>= 1.2021.5'
gem "bootsnap", require: false
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'ransack'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem "sassc-rails"

gem 'kaminari'

gem "hotwire-rails"




group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

