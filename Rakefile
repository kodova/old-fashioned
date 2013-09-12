require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'
Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :test do
  puts "Creating a Old Fashioned directory..."
  `oldfashioned install --path test`
  puts "Generating CSS..."
  `sass --watch test:css/ --style expanded`
end

task :clean do
  puts "Deleting OldFashioned directory..."
  `rm -rf test/old_fashioned`
  puts "Deleting generated CSS..."
  `rm -rf css/`
end