require 'rails'
require 'mongoid'

module WillPaginateMongoid
  class Engine < ::Rails::Engine
    initializer "including extensions" do
      ::Mongoid::Document.send :include, WillPaginateMongoid::MongoidPaginator
      ::Mongoid::Criteria.send :include, WillPaginateMongoid::MongoidPaginator
    end
  end
end
