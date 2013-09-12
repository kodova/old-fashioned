$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "old_fashioned/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "old_fashioned"
  s.version     = OldFashioned::VERSION
  s.authors     = ["Patrick Arnold"]
  s.email       = ["support@kodova.com"]
  s.homepage    = "https://github.com/kodova/old-fashioned"
  s.summary     = "Components build on top of Thoughtbots Buorbon sass library"
  s.description = "Empty for now"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('sass', '>= 3.2')
  s.add_dependency('bourbon', '>= 2.1')

  s.add_development_dependency('aruba', '~> 0.4')
  s.add_development_dependency('rake')
  s.add_development_dependency('css_parser')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('bundler')
  s.add_development_dependency('rb-fsevent', '~> 0.9.1')
end
