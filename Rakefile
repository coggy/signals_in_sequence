require 'rspec/core/rake_task'
require_relative "lib/finder"

desc "run tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rspec_opts = '--color'
end

desc "clean the out directory"
task :clean do
  rm_rf "out"
  mkdir "out"
end

desc "run the finder"
task :run => :clean do
  Finder.new.run
end