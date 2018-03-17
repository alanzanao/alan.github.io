# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-clean-blog"
  spec.version       = "4.0.0.1"
  spec.authors       = ["Alan Zanão da Penha"]
  spec.email         = ["alan.zanao@outlook.com"]

  spec.summary       = %q{A simple blog of a simple student.}
  spec.homepage      = "alanzanao.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.6"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
