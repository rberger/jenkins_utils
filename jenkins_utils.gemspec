# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','jenkins_utils','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'jenkins_utils'
  s.version = JenkinsUtils::VERSION
  s.author = 'Robert J. Berger'
  s.email = 'rberger@ibd.com'
  s.homepage = 'http://blog.ibd.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Varius tools to use in jenkins jobs'
# Add your other files here if you make them
  s.files = %w(
bin/jenkins_utils
lib/jenkins_utils/version.rb
lib/jenkins_utils.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','jenkins_utils.rdoc']
  s.rdoc_options << '--title' << 'jenkins_utils' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'jenkins_utils'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.8.1')
  s.add_runtime_dependency('versionomy')
end
