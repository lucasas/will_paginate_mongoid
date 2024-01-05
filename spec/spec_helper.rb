require 'rails'
require 'mongoid'
require 'will_paginate'
require 'will_paginate_mongoid'
require File.join(File.dirname(__FILE__), 'fake_app')
require 'rspec/rails'
require 'rspec/its'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.before :each do
    Mongoid::Clients.default.collections.select do |collection|
      collection.name !~ /system/
    end.each(&:drop)
  end
end

Mongoid.configure do |config|
  config.connect_to("will_paginate_mongoid_test")
end
