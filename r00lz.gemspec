
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "r00lz/version"

Gem::Specification.new do |spec|
  spec.name          = "r00lz"
  spec.version       = R00lz::VERSION
  spec.authors       = ["Kyle Zimmerman"]
  spec.email         = ["kzdesignsios@gmail.com"]

  spec.summary       = %q{My first web framework}
  spec.description   = %q{A simple web framework that I am building to learn more about how web frameworks work.}
  spec.homepage      = "https://github.com/KZdesigns/r00lz_web_framework"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rack", "~> 2.0.7"
  spec.add_runtime_dependency "json", "~> 2.1.0"
end
