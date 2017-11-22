$:.unshift File.expand_path('../lib', __FILE__)
require 'bootstrap/version'

Gem::Specification.new do |s|
  s.name        = 'bootstrap'
  s.version     = Bootstrap::VERSION
  s.summary     = 'Bootstrap a development environment.'
  s.description = 'Bootstrap process YAML files to configure your computer.'
  s.authors     = ['Gary A. Howard']
  s.email       = ['gary.a.howard@mac.com']
  s.homepage    = 'https://github.com/Traap/bootstrap'
  s.license     = 'BSD-3-Clause'

  s.files         = `git ls-files -z`.split('\x0').reject do |f|
    f.match(%r{^(app|bundle|example|features|test|spec)/})
  end

  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.16'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'test-unit', '~>3.2', '~> 3.2.3'
end
