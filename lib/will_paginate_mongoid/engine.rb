require 'rails'
require 'mongoid'
require 'will_paginate'

module WillPaginateMongoid
  class Engine < ::Rails::Engine
    initializer "including extensions" do
      ::Mongoid::Document.send :include, WillPaginateMongoid::MongoidPaginator
      ::Mongoid::Criteria.send :include, WillPaginateMongoid::MongoidPaginator
    end
  end
end
