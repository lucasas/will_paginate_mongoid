require "mongoid"
require "will_paginate"
require "will_paginate/collection"
require "will_paginate_mongoid/version"
require "will_paginate_mongoid/mongoid_paginator"

::Mongoid::Document.send :include, WillPaginateMongoid::MongoidPaginator
::Mongoid::Criteria.send :include, WillPaginateMongoid::MongoidPaginator
