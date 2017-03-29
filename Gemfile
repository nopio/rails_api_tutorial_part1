source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'active_model_serializers', '~> 0.10.0'
gem 'rack-cors'
gem 'rack-attack'
gem 'will_paginate'

group :development, :test do
  gem 'pry-rails'
  gem 'faker'
end

group :development do
  gem 'bullet'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
