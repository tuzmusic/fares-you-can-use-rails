# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :import_all do 
  # doesn't work for some reason
  # NameError: uninitialized constant ApplicationRecord
  require_relative 'config/application'
  require_relative 'app/models/airport'
  Airport.import_all_from_gem
end

task :console do
  Pry.start
end

task :links do
  Deal.all.each do |d|
    links = d.description.scan(/href=['"](\S+)['"]>(\D+)</)
    links.each do |l|
      url = l[0]
      text = l[1]
      d.links.create(url: url, text: text)
    end
  end
end