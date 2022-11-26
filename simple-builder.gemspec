Gem::Specification.new do |gem|
  gem.name          = 'simple-builder'
  gem.version       = '0.2'
  gem.licenses      = ['MIT']
  gem.authors       = 'John Labovitz'
  gem.email         = 'johnl@johnlabovitz.com'
  gem.summary       = %q{Simple HTML builder}
  gem.description   = %q{Simple HTML builder.}
  gem.homepage      = 'https://github.com/jslabovitz/simple-builder.git'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'nokogiri', '~> 1.13'
  gem.add_dependency 'rubypants', '~> 0.7'

  gem.add_development_dependency 'bundler', '~> 2.3'
  gem.add_development_dependency 'minitest', '~> 5.16'
  gem.add_development_dependency 'minitest-power_assert', '~> 0.3'
  gem.add_development_dependency 'rake', '~> 13.0'
end