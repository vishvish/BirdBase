module Birdbase
  class App < Thor
    include Thor::Actions
    
    Thor::Sandbox::Birdbase::App.source_root( "./" )
    
    map "-L" => :list
    
    desc "install [APPNAME] [PACKAGE]", "create a new application with BirdBase, e.g. thor birdbase:app:install MySite com.example.mysite"
    def install( name, package)
      puts "installing as #{name} in #{package}"
      
      package_path = package.split( "." ).join( "/" )
      
      @package = "#{package}.#{name}"
      
      puts "creating application runtime files..."      
      directory "./templates/birdbase/application", "../src/#{package_path}/#{name}", ( lambda { | content |  content.gsub( "<%= package %>", package ) } )
      
      puts "creating application entry point..."
      template "./templates/birdbase/Main.as.tt", "../src/Main.as", ( lambda { | content |  content.gsub( "<%= package %>", package ) } )
      
      puts "linking application to BirdBase framework"
      template "./templates/birdbase/ConfigureStateMachineCommand.as.tt", "../src/org/birdbase/framework/controller/configuration/ConfigureStateMachineCommand.as", ( lambda { | content |  content.gsub( "<%= package %>", package ) } )
      template "./templates/birdbase/BirdbaseContext.as.tt", "../src/org/birdbase/framework/BirdbaseContext.as", ( lambda { | content |  content.gsub( "<%= package %>", package ) } )
      
      
      puts ""
      puts "Basically, you're done."
      puts "Now create your application in Flash Builder stipulating Main.as for your Application, and build away."
      puts "If things fail to work, look at your html-template folder."
      puts "Flash Builder has a habit of cleaning this directory and might remove your assets, javascripts and pre-configured html.template"
      puts "If this happens, simply git revert the html-template directory."
      puts ""
      
    end
    
    desc "list [SEARCH]", "list all of the available apps, limited by SEARCH"
    def list( search = "" )
      #list
    end
    
  end
end