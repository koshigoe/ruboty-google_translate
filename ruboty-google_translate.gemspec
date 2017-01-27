# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/google_translate/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-google_translate"
  spec.version       = Ruboty::GoogleTranslate::VERSION
  spec.authors       = ["koshigoe"]
  spec.email         = ["koshigoeb@gmail.com"]

  spec.summary       = %q{Ruboty plugin to translate text.}
  spec.description   = %q{Ruboty plugin to translate text.}
  spec.homepage      = "https://github.com/koshigoe/ruboty-google_translate"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "ruboty", "~>1.3.0"
  spec.add_dependency "google-cloud-translate", "~>0.22.2"
end
