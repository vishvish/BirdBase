module Birdbase
  class App < Thor
    include Thor::Actions
    map "-L" => :list
    
    desc "install [APPNAME] [PACKAGE]", "create a new application with BirdBase, e.g. thor birdbase:app:install MySite com.example.mysite"
    def install( namespace, package)
      puts "installing into #{namespace} for #{package}"
    end
    
    desc "list [SEARCH]", "list all of the available apps, limited by SEARCH"
    def list( search = "" )
      #list
    end
    
  end
end