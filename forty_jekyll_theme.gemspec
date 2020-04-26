# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "chaithyagr"
  spec.version       = "0.0.0"
  spec.authors       = ["Chaithya G R"]
  spec.email         = ["chaithyagr@gmail.com"]

  spec.summary       = %q{My Personal Webpage}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_development_dependency "jekyll", "~> 4.0"
  spec.add_development_dependency "bundler", "~> 2.1"
end
