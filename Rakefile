require 'bundler'

Bundler::GemHelper.install_tasks
# GemInABox changes, that modifies behavior of `rake release`. TO be thrown away, once gem in
# a box supports a better way got to release a gem
#
# Don't push the gem to rubygems
ENV["gem_push"] = "false" # Utilizes feature in bundler 1.3.0
# Let bundler's release task do its job, minus the push to Rubygems,
# and after it completes, use "gem inabox" to publish the gem to our
# internal gem server.
Rake::Task["release"].enhance do
  spec = Gem::Specification.load(Dir.glob("*.gemspec").first)
  sh "gem inabox pkg/#{spec.name}-#{spec.version}.gem"
end
