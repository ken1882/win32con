require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'win32con'
  spec.version    = '0.1.0'
  spec.authors    = ['Jun-Kai Chao']
  spec.license    = 'MIT'
  spec.email      = 'qj6w94g0q@gmail.com'
  spec.homepage   = 'http://github.com/ken1882/win32con'
  spec.summary    = 'A simple gem defines windows constants'
  spec.files      = ['lib/win32con.rb', 'lib/win32con/keymap.rb']
  spec.require_paths = ['lib']

  spec.description = <<-EOF
    A simple gem that defines constants in `windows.h`
  EOF
end