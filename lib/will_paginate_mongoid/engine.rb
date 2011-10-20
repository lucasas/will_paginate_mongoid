require 'rails'
require 'mongoid'

module WillPaginateMongoid
  class Engine < ::Rails::Engine
    initializer "including extensions" do
      ::Mongoid::Document.send :include, WillPaginateMongoid::MongoidPaginator::Document
    end
  end
end
