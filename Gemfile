source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails_12factor', group: :production

gem 'rails', github: 'rails/rails', ref: 'f823431'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers', ref: '8981683'

gem 'pg'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'rack-cors'

gem 'imdb'

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

