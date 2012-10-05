# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "will_paginate_mongoid/version"

Gem::Specification.new do |s|
  s.name        = "will_paginate_mongoid"
  s.version     = WillPaginateMongoid::VERSION
  s.authors     = ["Lucas Souza"]
  s.email       = ["lucasas@gmail.com"]
  s.homepage    = ""
  s.summary     = "An extension that becomes possible use paginate method with Mongoid"
  s.description = ""

  s.rubyforge_project = "will_paginate_mongoid"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "mongoid", ">= 2.4"
  s.add_runtime_dependency "will_paginate", "~> 3.0"
end
