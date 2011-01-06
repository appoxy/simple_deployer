require 'simple_deployer/client'
require 'simple_deployer/config'
require 'appoxy_rails'
module SimpleDeployer

    class << self
        attr_accessor :config,
                      :service

        def configure()
            SimpleDeployer.config ||= Config.new
            yield(config)
            SimpleDeployer.service = Service.new(config.access_key, config.secret_key, :config=>config)
        end
    end    
end