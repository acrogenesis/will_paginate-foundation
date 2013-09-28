# will_paginate-foundation

![Foundation Pagination Component](https://raw.github.com/acrogenesis/will_paginate-foundation/master/pagination.png)
This gem integrates the [Foundation](http://foundation.zurb.com) [pagination component](http://foundation.zurb.com/docs/components/pagination.html) with the [will_paginate](https://github.com/mislav/will_paginate) pagination gem.

## Install

  * `gem install will_paginate-foundation`, *or*
  * For projects using Bundler, add `gem 'will_paginate-foundation'` to your `Gemfile` (and then run `bundle install`).

## Usage

### Rails

  1. Load the Foundation CSS in your template.
  2. In your view, use the `renderer: FoundationPagination::Rails` option with the `will_paginate` helper, for example:

```ruby
<%= will_paginate @collection, renderer: FoundationPagination::Rails %>
```
