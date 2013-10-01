require 'will_paginate'

if defined?(ActionView)
  require "foundation_pagination/action_view"
end

if defined?(Sinatra)
  require "foundation_pagination/sinatra"
end
