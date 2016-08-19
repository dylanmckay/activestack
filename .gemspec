Gem::Specification.new do |s|
  s.name        = 'activestack'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "Backtraces for ActiveRecord objects"
  s.description = <<END
A library for getting detailed stacktraces (with active record variables).
END
  s.authors     = ["Dylan McKay"]
  s.email       = 'dylanmckay34@gmail.com'
  s.files       = ["lib/activestack.rb"]
  s.homepage    = 'https://github.com/dylanmckay/activestack'

  s.add_runtime_dependency 'stackdo', '~> 0.0.4', '>= 0.0.4'
end

