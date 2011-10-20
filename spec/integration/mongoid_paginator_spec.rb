require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe WillPaginateMongoid::MongoidPaginator do
  before :all do
    class Game
      include ::Mongoid::Document
      field :title, :type => String
    end
  end
  
  describe :paginate do
  end
end