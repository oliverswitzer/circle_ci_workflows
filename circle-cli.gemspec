
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circle_cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'circle-cli'
  spec.version       = CircleCli::VERSION
  spec.authors       = ['Oliver Switzer']
  spec.email         = ['oliver@kickstarter.com']

  spec.summary       = 'A CLI gem that allows you to view workflows and be notified of their completion from the terminal'
  spec.description   = ''
  spec.homepage      = 'https://github.com/kickstarter/circle-cli'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to "http://mygemserver.com"'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = ['circlecli']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'

  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'http'
  spec.add_runtime_dependency 'thor'
end
