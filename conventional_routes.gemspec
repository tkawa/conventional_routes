# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "conventional_routes/version"

Gem::Specification.new do |s|
  s.name        = "conventional_routes"
  s.version     = ConventionalRoutes::VERSION
  s.authors     = ["Toru KAWAMURA"]
  s.email       = ["tkawa@4bit.net"]
  s.homepage    = "https://github.com/tkawa/conventional_routes"
  s.summary     = %q{CoC routes provider for Rails}
  s.description = %q{provide conventional routes without a definition.}

  s.rubyforge_project = "conventional_routes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
