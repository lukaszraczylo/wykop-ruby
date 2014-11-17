require 'bundler'
Bundler::GemHelper.install_tasks
task :default => :spec

desc "Run all wykop gem specs"
task :spec do
  exec "rspec -c spec"
end