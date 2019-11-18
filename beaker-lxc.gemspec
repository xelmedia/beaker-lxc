# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'beaker-lxc/version'

Gem::Specification.new do |s|
  s.name        = "beaker-lxc"
  s.version     = BeakerLxc::VERSION
  s.authors     = ["Theo van Oostrum"]
  s.email       = ["theo@xel.nl"]
  s.homepage    = "https://github.com/xelmedia/beaker-lxc"
  s.summary     = %q{Beaker DSL Extension Helpers!}
  s.description = %q{For use for the Beaker acceptance testing tool}
  s.license     = 'Apache2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Testing dependencies
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its'
  # pin fakefs for Ruby < 2.3
  if RUBY_VERSION < "2.3"
    s.add_development_dependency 'fakefs', '~> 0.6', '< 0.14'
  else
    s.add_development_dependency 'fakefs', '~> 0.6'
  end
  s.add_development_dependency 'rake', '~> 10.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'pry', '~> 0.10'

  # Run time dependencies
  s.add_runtime_dependency 'stringify-hash', '~> 0.0.0'

end

