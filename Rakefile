begin
    require 'jeweler'
    Jeweler::Tasks.new do |gemspec|
        gemspec.name = "simple_deployer"
        gemspec.summary = "Appoxy simple_deployer Gem"
        gemspec.description = "Appoxy simple_deployer Gem"
        gemspec.email = "roman@appoxy.com"
        gemspec.homepage = "http://www.appoxy.com"
		gemspec.files =  FileList["[A-Z]*", "lib/**/*","bin/sd"]
        gemspec.authors = ["Roman Kononov"]        
		gemspec.executables = "sd"
        gemspec.add_dependency 'aws'		
        gemspec.add_dependency 'zip'
		gemspec.add_dependency 'appoxy_rails'
		gemspec.add_development_dependency "rake"
    end
rescue LoadError
    puts "Jeweler not available. Install it with: sudo gem install jeweler -s http://gems.github.com"
end
