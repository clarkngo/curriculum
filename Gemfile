source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'activeadmin',             '~> 1.4', '>= 1.4.3'

gem 'bootsnap',                '>= 1.1.0', require: false

gem 'bootstrap',               '~> 4.3.1'


gem 'carrierwave',             '~> 1.3.1'
gem 'coderay',                 '~> 1.1', '>= 1.1.2'


gem 'devise',                  '~> 4.6.0'  


gem 'faker',                   '~> 1.9.1'
gem 'figaro',                  '~> 1.1.1'
gem 'font-awesome-rails',      '~> 4.7', '>= 4.7.0.4'

gem 'rails',                   '~> 5.2.2'

gem 'jquery-rails',            '~> 4.3.3'

gem 'mini_magick',             '~> 4.9.2'

gem 'pg',                      '>= 0.18', '< 2.0'
gem 'popper_js',               '< 2', '>= 1.12.9'
gem 'puma',                    '~> 3.11'
gem 'pundit',                  '~> 2.0',  '>= 2.0.1'

gem 'redcarpet',               '~> 3.4'
gem 'redis',                   '~> 4.1'

gem 'sass-rails',              '~> 5.0'

gem 'simple_form',             '~> 4.1.0'

gem 'turbolinks',              '~> 5'

gem 'uglifier',                '>= 1.3.0'

group :production do
  gem 'fog-aws',               '~> 3.3'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails',     '~> 4.11', '>= 4.11.1'
  gem 'rspec-rails',           '~> 3.8', '>= 3.8.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara',              '~> 3.12'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# BootStrap dependency
source 'https://rails-assets.org' do
  gem 'rails-assets-tether',   '>= 1.3.3'
end
