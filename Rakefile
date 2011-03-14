require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the devise_imapable plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  rails_root = File.join(File.dirname(__FILE__), 'test', 'rails_root')
  system("cd #{rails_root} && rake")
end

desc 'Setup the test environment.'
namespace :test do
  task :setup do
    rails_root = File.join(File.dirname(__FILE__), 'test', 'rails_root')
    system("cd #{rails_root} && bundle install && rake db:migrate && rake db:test:prepare")
  end
end

desc 'Generate documentation for the devise_imapable plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'DeviseImapable'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "devise_imapable"
    gemspec.summary = "Devise Imap authentication module"
    gemspec.description = "For when you don't have access to LDAP"
    gemspec.email = "josh.kalderimis@gmail.com"
    gemspec.homepage = "http://github.com/joshk/devise_imapable"
    gemspec.authors = ["Josh Kalderimis","Louis St-Amour"]
    gemspec.add_runtime_dependency "devise", "> 1.0.4"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
