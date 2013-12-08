require "will_paginate/view_helpers/sinatra"
require "foundation_pagination/foundation_renderer"

module FoundationPagination
  # A custom renderer class for WillPaginate that produces markup suitable for use with Zurb Foundation.
  class Sinatra < WillPaginate::Sinatra::LinkRenderer
    include FoundationRenderer
  end
end

