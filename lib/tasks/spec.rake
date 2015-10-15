begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  namespace :spec do
    desc "Run the code examples in spec/ except those in spec/features"
    RSpec::Core::RakeTask.new(:without_features) do |t|
      t.exclude_pattern = 'spec/features/**/*_spec.rb'
    end
  end

rescue LoadError
  namespace :spec do
    task :without_features do
    end
  end
end

Rake::Task['spec'].clear_actions

desc 'Runs all specs'
task spec: ['spec:without_features', 'spec:features', 'spec:javascripts']
