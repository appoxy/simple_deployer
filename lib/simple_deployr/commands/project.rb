module SimpleDeployr::Command

    class Project < CommandsBase

        def main
            get_project
            project = @service.project_info(@pr_id)
            p "Project info"
            project.each_pair do |k, v|
                p "#{k}:#{v}"
            end
        end


        def create
            puts "Packaging local folder"
            file = package(Dir.getwd)
            p "Packing done"
            p "Uploading"
            upload(file)
            p "creating project"
            pr_id = @service.create_project(File.basename(file, '.*') + "_project", File.basename(file), @service.config.aws_access_key, @service.config.aws_secret_key)
            @service.config.project_id = pr_id
            @service.config.save_config
            p "Project created, project id saved as default"
#            p "launching server " + pr_id
#            @service.launch_server(pr_id)
#            p "server launched"
        end


        def servers
            get_project
            servers = @service.servers_list(@pr_id)
            if servers.size >0
                servers.each do |s|
                    p "ID:" + s["id"] + "; status:" + s["status"]
                end
            else
                p "No active servers"

            end
        end


        def launch_server
            get_project
            @service.launch_server(@pr_id)
        end


        def databases
            get_project
            databases = @service.databases_list(@pr_id)
            p databases.size >0 ? databases : "No active databases"

        end


        def load_balancer
            get_project
            lb = @service.load_balancer(@pr_id)
            p lb ? lb : "No load balancer"
        end


        def deploy_folder
            get_project
            file = package(Dir.getwd)
            upload(file)
            @service.deploy_code(pr_id, "scm_url"=> File.basename(file), "scm_type"=>"s3")
            p "Code deployed"
        end


        def deploy
            get_project
            @service.deploy_code(@pr_id)
        end


    end
end

