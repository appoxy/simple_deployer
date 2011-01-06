require 'simple_deployer/commands/base'
Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |c| require c }
module SimpleDeployer
    module Command
        class << self
            def run(command, args)
                config = Config.new()
                config.read()
                begin
                    service = SimpleDeployer::Service.new(config) #authorization should be there
                    klass, method = parse(command)
                    runner = klass.new(args, service)
                    runner.send(method)
                rescue RestClient::RequestTimeout
                    p "API request timed out."
                rescue NameError,NoMethodError =>ex
                    p "Invalid command please type 'sd' for help"
                    p ex.inspect
                end
            end


            def parse(command)
                begin
                    parts = command.split(".")
                    return eval("SimpleDeployer::Command::#{parts[0].capitalize}"), parts[1] ? parts[1].to_sym : :main
                end
            end
        end
    end
end