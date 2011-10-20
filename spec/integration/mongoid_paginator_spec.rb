require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe WillPaginateMongoid::MongoidPaginator do
  before :all do
    class Game
      include ::Mongoid::Document
      field :title, :type => String
    end
  end
  
  describe :paginate do
    context "when called in a Mongoid::Document" do
      before :each do
        @games = 30.times.map do |i|
          Game.create :title => "title_#{i}"
        end
      end

      context "and parameters is given" do
        subject { Game.paginate :page => 2, :per_page => 10 }
        it { should be_a_instance_of WillPaginate::Collection }
        its(:to_a) { should == @games[10..19] }
        its(:total_entries) { should == Game.count }
      end

      context "and parameters is not given" do
        subject { Game.paginate }
        it { should be_a_instance_of WillPaginate::Collection }
        its(:to_a) { should == @games[0..9] }
        its(:total_entries) { should == 30 }
      end
    end
    
    context "when called in a Mongoid::Criteria" do
      before :each do
        @games = 15.times.map do |i|
          Game.create :title => "title"
        end

        15.times do
          Game.create :title => "other title"
        end

        @criteria = Game.where(:title => "title")
      end

      context "and parameters is given" do
        subject { @criteria.paginate :page => 2, :per_page => 10 }
        it { should be_a_instance_of WillPaginate::Collection }
        its(:to_a) { should == @games[10..14] }
        its(:total_entries) { should == @criteria.count }
      end

      context "and parameters is not given" do
        subject { @criteria.paginate }
        it { should be_a_instance_of WillPaginate::Collection }
        its(:to_a) { should == @games[0..9] }
        its(:total_entries) { should == @criteria.count }
      end
    end
  end
end
