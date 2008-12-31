# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  # define a observer class for users
  config.active_record.observers = :user_observer

  # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
  config.i18n.default_locale = 'pt-BR'

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  config.gem 'rubyist-aasm', :lib => 'aasm', :source => 'http://gems.github.com', :version => '2.0.2'
  config.gem 'mislav-will_paginate', :version => '2.3.6', :lib => 'will_paginate', :source => 'http://gems.github.com'

  # Make Time.zone default to the specified zone, and make Active Record store time values
  config.time_zone = 'UTC'

  config.action_controller.session = {
    # CHANGE THIS FOR YOUR APP NAME
    :session_key => '_origin_restful_authentication_session', 
    :secret      => '8d6e6ba4c40a0cbc607114e2bc334c3e46c4c999d699543938f761de14fde11b042114bd278ea756823ce34144e0fefab33ecd2116e3208e62aa800beb34065d'
  }
  
end