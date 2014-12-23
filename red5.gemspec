# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'red_5/version'

Gem::Specification.new do |spec|
  spec.name          = 'red5'
  spec.version       = Red5::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['sam@pikesley.org']
  spec.summary       = %q{Ruby bindings for the Star Wars API}
  spec.description   = %q{}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest_client', '~> 1.8'
  spec.add_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'guard', '~> 2.10'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'
  spec.add_development_dependency 'terminal-notifier-guard', '~> 1.6'
  spec.add_development_dependency 'vcr',  '~> 2.9'
  spec.add_development_dependency 'webmock', '~> 1.18'
  spec.add_development_dependency 'coveralls', '~> 0.7'
end
