Gem::Specification.new do |s|
  s.name        = 'hecks-active_model'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Hecks Domain Objects as Active Models'
  s.description = ''
  s.authors     = ["Hecks Active Model Developer"]
  s.email       = 'support@the_good_guys.com'
  s.files       = Dir['{lib, bin}/**/*']

  s.add_dependency 'activemodel', '~> 6.0'
  s.add_dependency 'hecks-app', '0.1.0'
end
