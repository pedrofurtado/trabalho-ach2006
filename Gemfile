source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1'
gem 'rails-i18n'
gem 'pg'
gem 'puma'
gem 'bundler'
gem 'slim'
gem 'slim-rails'
gem 'simple_form'
gem 'devise'
gem 'devise-i18n'
gem 'tzinfo-data'

gem 'coffee-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'sprockets'
gem 'sprockets-rails'

gem 'font-awesome-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-bootstrap', '~> 3.0'
  gem 'rails-assets-adminlte'
  gem 'rails-assets-select2'
  gem 'rails-assets-bootstrap-table'
  gem 'rails-assets-moment'
  gem 'rails-assets-fullcalendar'
end

group :development, :test do
  gem 'byebug', platforms: :mri
  gem 'capybara'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'coveralls', require: false
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end
