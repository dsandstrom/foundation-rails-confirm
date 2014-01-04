# -*- encoding: utf-8 -*-
require File.expand_path('../lib/foundation/rails/confirm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mikko Kokkonen"]
  gem.email         = ["mikko@mikian.com"]
  gem.description   = %q{Confirm dialogs using ZRUB Foundation}
  gem.summary       = %q{Applies a custom confirm dialog for elements with a data-confirm attribute.}
  gem.homepage      = "https://github.com/mikian/foundation-rails-confirm"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "foundation-rails-confirm"
  gem.require_paths = ["lib", "vendor"]
  gem.version       = Foundation::Rails::Confirm::VERSION
end
