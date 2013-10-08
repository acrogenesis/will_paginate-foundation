require "foundation_pagination/version"

module FoundationPagination
  # Contains functionality shared by all renderer classes.
  module FoundationRenderer

    def to_html
      list_items = pagination.map do |item|
        case item
          when Fixnum
            page_number(item)
          else
            send(item)
        end
      end.join(@options[:link_separator])

      if @options[:foundation].to_i >= 3
        tag("ul", list_items, class: "pagination #{@options[:class]}")
      else
        html_container(tag("ul", list_items))
      end
    end
    def html_container(html)
      tag(:ul, html, container_attributes) 
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      link_options = @options[:link_options] || {}
      tag :li, link(page, page, link_options.merge(rel: rel_value(page))), :class => ('current' if page == current_page)
    end

    def gap
      tag :li, link('&hellip;', '#'), :class => 'unavailable'
    end

#    def previous_page
#      num = @collection.current_page > 1 && @collection.current_page - 1
#      previous_or_next_page(num, @options[:previous_label], "prev")
#    end

#    def next_page
#      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
#      previous_or_next_page(num, @options[:next_label], "next")
#    end

    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}
      tag :li, link(text, page || '#', link_options), :class => [classname[0..3], classname, ('unavailable' unless page)].join(' ')
      
    end
  end
end
