require 'rails'
require 'mongoid'
require 'will_paginate'
require 'will_paginate_mongoid'
require File.join(File.dirname(__FILE__), 'fake_app')
require 'rspec/rails'


Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.before :each do
    Mongoid.master.collections.select do |collection|
      collection.name !~ /system/
    end.each(&:drop)
  end
end

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("will_paginate_mongoid_test")
end
