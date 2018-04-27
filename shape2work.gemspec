
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shape2work/version'

Gem::Specification.new do |spec|
  spec.name          = 'shape2work'
  spec.version       = Shape2work::VERSION
  spec.authors       = ['Igor Amorim Silva']
  spec.email         = ['igoramorimsilva2@gmail.com']

  spec.summary       = ' Convert Shape Files to another format '
  spec.description   = 'Simple gem to read shape files and convert to another format'
  spec.homepage      = 'https://github.com/imperiumzigna/shape2work'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/imperiumzigna/shape2work'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rgeo', '~> 1.0'
  spec.add_dependency 'rgeo-geojson'
  spec.add_dependency 'rgeo-shapefile'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
