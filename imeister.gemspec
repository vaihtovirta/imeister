# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imeister/version'

Gem::Specification.new do |spec|
  spec.name          = 'imeister'
  spec.version       = Imeister::VERSION
  spec.authors       = ['Emil Shakirov']
  spec.email         = ['5o.smoker@gmail.com']

  spec.summary       = 'Tiny gem for fetching information about Apple Phones by imei'
  spec.homepage      = 'https://github.com/vaihtovirta/imeister'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'faraday', '~> 0.9.1'
  spec.add_development_dependency 'vcr', '~> 2.9.3'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'wannabe_bool'
  spec.add_development_dependency 'rspec'
end
