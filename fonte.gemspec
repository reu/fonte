# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fonte/version"

Gem::Specification.new do |s|
  s.name        = "fonte"
  s.version     = Fonte::VERSION
  s.authors     = ["Rodrigo Navarro"]
  s.email       = ["rnavarro1@gmail.com"]
  s.homepage    = "https://github.com/reu/fonte"
  s.summary     = "Valve Source Engine log parser"

  s.rubyforge_project = "fonte"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "treetop"
end
