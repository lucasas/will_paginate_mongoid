module WillPaginateMongoid
  DEFAULT_PER_PAGE = 10

  module MongoidPaginator
    class << self
      def base_options(options)
        options[:page] ||= 1
        options[:per_page] ||= 10
        options[:offset] = (options[:page].to_i - 1) * options[:per_page]
        options
      end

      def fill_pager_with(medias, size, pager)
        pager.replace medias.to_a
        pager.total_entries = size
      end
    end

    module Document
      extend ActiveSupport::Concern

      included do
        def self.paginate(options = {})
          options = MongoidPaginator.base_options options

          WillPaginate::Collection.create(options[:page], options[:per_page]) do |pager|
            MongoidPaginator.fill_pager_with self.skip(options[:offset]).limit(options[:per_page]), self.count, pager
          end
        end
      end
    end
  end
end
