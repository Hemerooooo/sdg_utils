require 'rubygems'

Gem::Specification.new do |s|
  s.name = "sdg_utils"
  s.author = "Aleksandar Milicevic"
  s.email = "aleks@csail.mit.edu"
  s.version = "0.0.1"
  s.summary = "Various utils from the SDG @ MIT"
  s.description = "Various utils from the SDG @ MIT"
  s.files = Dir['lib/**/*.rb']
  s.require_paths = ["lib"]
  s.test_files = Dir['test/**/*test.rb']

  s.add_runtime_dependency "nilio"
  s.add_runtime_dependency "parser", [">= 2.0.0.pre7"]
  s.add_runtime_dependency "method_source", [">= 0.8.3"]
end
