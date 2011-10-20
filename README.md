Will Paginate Mongoid
========

A simple gem that allows you use pagination using Mongoid
---------------------------------------------------------------------

### Why use this gem?

Because will_paginate does not support mongoid `skip` and `limit` methods.
They just supports `paginate` method in `Array` class. So what it means?
Will_Paginate, find all objects and after that cut the needed objects.
It can cause performance problems when you have a lot of objects.

### How I install it?

In your `Gemfile` use `gem "will_paginate_mongoid"` and run `bundle install`

or

Just run `gem install will_paginate_mongoid`

### How it works?

It just create a `paginate` method compatible with will_paginate interface
and add two additional criterias: `skip` and `limit`

### Just that?

Yes. Now you can use `paginate` method like in [will_paginate documentation](https://github.com/mislav/will_paginate/wiki)
