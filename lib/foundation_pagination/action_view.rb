require "will_paginate/view_helpers/action_view"
require "foundation_pagination/foundation_renderer"

module FoundationPagination
  # A custom renderer class for WillPaginate that produces markup suitable for use with Twitter Bootstrap.
  class Rails < WillPaginate::ActionView::LinkRenderer
    include FoundationRenderer
  end
end
