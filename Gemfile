source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

########################################
# ~ means gem we added for the project #
########################################

# https://github.com/ankane/groupdate
# The simplest way to group temporal data
gem 'groupdate'

# https://github.com/ankane/chartkick
# Create beautiful JavaScript charts with one line of Ruby
gem 'chartkick'

# https://github.com/kaminari/kaminari
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari', '~> 1.2.2'

# ~ Vite [https://github.com/ElMassimo/vite_ruby#readme]
# Replaces rails crappy front end assets management
gem 'vite_rails'

# ~ Tailwind CSS [https://github.com/rails/tailwindcss-rails#readme]
# More flexible than bootstrap
gem 'tailwindcss-rails'

# ~ Faker [https://github.com/faker-ruby/faker#readme]
# For generating fake data
gem 'faker'

# ~ bcrypt [https://github.com/bcrypt-ruby/bcrypt-ruby#readme]
# For password hashing
gem 'bcrypt'

# ~ devise [https://github.com/heartcombo/devise#readme]
gem 'devise'

# ~ SendGrid or Mailjet [readme-url]
# For sending emails
# TO BE DECIDED BY THE TEAM

# ~ https://github.com/omniauth/omniauth#readme
# ~ https://github.com/zquestz/omniauth-google-oauth2#readme
# ~ https://github.com/cookpad/omniauth-rails_csrf_protection#readme
# For Google SSO
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

# ~ Amazon S3 [https://github.com/aws/aws-sdk-ruby#readme]
# For active storage
gem 'aws-sdk-s3', require: false

# ~ httparty [https://github.com/jnunemaker/httparty#readme]
# For handling API requests
gem 'httparty'

# ~ Unsplash [https://github.com/unsplash/unsplash_rb#readme]
# For generating random images during dev and prod tests
gem 'unsplash'
gem 'geocoder'
# ########################################

group :development do
  # ~ Better Errors [https://github.com/BetterErrors/better_errors#readme]
  # For better error messages
  gem 'better_errors'
  gem 'binding_of_caller'

  # ~ DatabaseConsistency [https://github.com/djezzzl/database_consistency#readme]
  # For checking database consistency
  gem 'database_consistency', require: false

  # ~ table_print [https://github.com/arches/table_print#readme]
  # For console display of the database
  gem 'table_print'

  # ~ erb-formatter [https://github.com/nebulab/erb-formatter#readme]
  # For formatting ERB files
  gem 'erb-formatter'

  # ~ rubocop [https://github.com/rubocop/rubocop#readme]
  # ~ rubocop-faker [https://github.com/koic/rubocop-faker#readme]
  # ~ rubocop-rails [https://github.com/rubocop/rubocop-rails#readme]
  # ~ rubocop-rspec [https://github.com/rubocop/rubocop-rspec#readme]
  # For code quality
  gem 'rubocop', require: false
  gem 'rubocop-faker'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

# ########################################

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # ~ rspec [https://github.com/rspec/rspec-rails#readme]
  # For testing
  gem 'rspec-rails', '~> 6.0.0.rc1'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'

end
