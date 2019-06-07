# frozen_string_literal: true

task default: %w[test]

task :test do
  puts "\nBuilding project"
  try 'middleman build'
end

task :deploy do
  puts "\nDeploying to GitHub"
  try 'middleman deploy'
end

namespace :travis do
  task :script do
    Rake::Task['test'].invoke
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
