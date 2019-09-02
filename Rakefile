# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: %w[spec build]

task :build do
  puts "\nBuilding project"
  try 'middleman build'
end

task :deploy do
  puts "\nDeploying"
  try 'middleman deploy'
end

namespace :travis do
  task :script do
    Rake::Task['spec'].invoke
    Rake::Task['build'].invoke
  end

  task :after_success do
    try './travis-deploy.sh'
  end
end

## Helper so we fail as soon as a command fails.
def try(command)
  system command
  raise "Command: `#{command}` exited with code #{$?.exitstatus}" if $? != 0
end
