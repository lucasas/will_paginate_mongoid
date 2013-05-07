Will Paginate Mongoid
========

A simple gem that allows you to use pagination with Mongoid
---------------------------------------------------------------------

### Why use this gem?

Because will_paginate does not support the mongoid `skip` and `limit` methods.
They just support the `paginate` method in the `Array` class. What does this mean?
Will_Paginate will find all the objects and then cut out the unneeded ones.
This can cause performance problems when you have a lot of objects.

### How I install it?

Add `gem "will_paginate_mongoid"` to your `Gemfile` and run `bundle install`

or

Just run `gem install will_paginate_mongoid`

### How it works?

It just creates a `paginate` method compatible with will_paginate interface
and adds two additional criteria: `skip` and `limit`

### That's it?

Yes. Now you can use the `paginate` method just like in the [will_paginate documentation](https://github.com/mislav/will_paginate/wiki)
