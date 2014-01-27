require "sinatra"
require "will_paginate-foundation"
require "will_paginate/collection"

$template = <<EOHTML
<html>
<head>
<title>will_paginate-foundation Example App</title>
<link href="http://cdnjs.cloudflare.com/ajax/libs/foundation/5.0.3/css/foundation.min.css" rel="stylesheet">
</head>
<body>
</br>
<%= will_paginate @collection, renderer: FoundationPagination::Sinatra %>
</body>
</html>
EOHTML

def build_collection
  page = if params[:page].to_i > 0
    params[:page].to_i
  else
    1
  end

  @collection = WillPaginate::Collection.new page, 10, 100000
end

get "/" do
  build_collection
  erb $template
end
