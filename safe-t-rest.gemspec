Gem::Specification.new do |s|
  s.name        = 'safe-t-rest'
  s.version     = '0.0.3'
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'A ruby gem to interact with Safe-T Box.'
  s.description = 'Ruby gem to interact with Safe-T Box rest API. '
  s.authors     = ['Bar Hofesh']
  s.email       = ['Bar.Hofesh@safe-t.com']
  s.homepage    = 'https://github.com/bararchy/safe-t-rest'
  s.license     = 'none'

  s.files = Dir[
    'README.md',
    'Rakefile',
    'lib/*.rb',
    '*.gemspec'
  ]

  s.add_dependency 'rest-client', '~> 1.7', '>= 1.7.3'
end
