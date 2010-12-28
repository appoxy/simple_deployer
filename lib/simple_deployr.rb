require 'simple_deployr/client'
require 'simple_deployr/config'
require 'appoxy_api'
module SimpleDeployr

    class << self
        attr_accessor :config,
                      :service

        def configure()
            SimpleDeployr.config ||= Config.new
            yield(config)
            SimpleDeployr.service = Service.new(config.access_key, config.secret_key, :config=>config)
        end
    end    
end