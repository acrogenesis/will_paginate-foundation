require "foundation_pagination/version"

module FoundationPagination
  # Contains functionality shared by all renderer classes.
  module FoundationRenderer

    def to_html
      list_items = pagination.map do |item|
        item.is_a?(Integer) ? page_number(item) : send(item)
      end.join(@options[:link_separator])

      tag("ul", list_items, :class => "pagination #{@options[:class]}")
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      link_options = @options[:link_options] || {}

      if page == current_page
        tag :li, tag(:span, page), :class => ('current')
      else
        tag :li, link(page, page, link_options.merge(:rel => rel_value(page)))
      end
    end

    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}
      if page
        tag :li, link(text, page, link_options), :class => classname
      else
        tag :li, tag(:span, text), :class => "%s disabled" % classname
      end
    end

    def gap
      tag :li, '', :class => 'ellipsis'
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], "pagination-previous")
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], "pagination-next")
    end

  end
end
