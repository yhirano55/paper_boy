# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "paper_boy/version"

Gem::Specification.new do |spec|
  spec.name          = "paper_boy"
  spec.version       = PaperBoy::VERSION
  spec.authors       = ["Yoshiyuki Hirano"]
  spec.email         = ["yhirano@me.com"]
  spec.summary       = %q{Automatically deliver notifications to subscribers from controllers.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/yhirano55/paper_boy"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
