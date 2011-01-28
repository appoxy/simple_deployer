require 'aws'
require 'appoxy_api'
module SimpleDeployer

    class Service < Appoxy::Api::Client

        attr_accessor :config


        def initialize(config, options={})
            puts 'Starting SimpleDeployer...'
            self.config = config
            super("http://www.simpledeployer.com/api/", config.access_key, config.secret_key, options)
            self.host = self.config.host if self.config && self.config.host
            self.version = "0.2"
        end


        def project_info(project_id)
            project = get("projects/#{project_id}")
        end


        def create_project(name, filename, aws_access_key, aws_secret_key)
            data = {"name"=>name, "scm_url"=>filename, "aws_access_key"=>aws_access_key, "aws_secret_key"=>aws_secret_key}
            ret = post("projects", data)
        end


        def launch_server(project_id)
            data = {"launch_in_worker"=>"true"}
            ret = get("projects/#{project_id}/launch_server", data)
        end


        def servers_list(project_id)
            servers = get("projects/#{project_id}/servers")
        end


        def databases_list(project_id)
            databases = get("projects/#{project_id}/databases")
        end


        def load_balancer(project_id)
            load_balancer = get("projects/#{project_id}/load_balancer")
        end


        def projects_list()
            projects = get("projects")
        end


        def deploy_code(project_id, params={})
            data = params
            p "DATA is" + data.to_s
            ret = get("projects/#{project_id}/deploy_code", data)
        end


        def server_status(server_id)
            status = get("servers/#{server_id}")
        end


        def reboot_server(server_id)
            get("servers/#{server_id}/reboot")
        end


        def terminate_server(server_id)
            delete("servers/#{server_id}")
        end
    end
end