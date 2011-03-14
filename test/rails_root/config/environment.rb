# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RailsRoot::Application.initialize!

Rails::Initializer.run do |config|
  # Point back to the plugin containing this rails_root
  config.plugin_paths = ["#{RAILS_ROOT}/../../../"]
  # Only load the plugin we're testing
  config.plugins = [ :devise_imapable ]
end
