module WillPaginateMongoid
  DEFAULT_PER_PAGE = 10

  module MongoidPaginator
    extend ActiveSupport::Concern

    included do
      def self.paginate(options = {})
        options = base_options options

        WillPaginate::Collection.create(options[:page], options[:per_page]) do |pager|
          fill_pager_with self.skip(options[:offset]).limit(options[:per_page]), options[:skip_count] ? 0 : self.count, pager
        end
      end


      def self.page(page)
        paginate({page: page})
      end

      private

      def self.base_options(options)
        options[:page] ||= 1
        options[:per_page] ||= (WillPaginate.per_page || 10)
        options[:offset] = (options[:page].to_i - 1) * options[:per_page].to_i
        options
      end

      def self.fill_pager_with(medias, size, pager)
        pager.replace medias.to_a
        pager.total_entries = size
      end
    end
  end
end
