source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'rails', '~> 6.0.2'
gem 'money-rails', '~>1.12'

gem 'pg'
gem 'puma', '~> 4.3.4'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
