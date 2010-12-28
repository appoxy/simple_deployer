module SimpleDeployr::Command
    class Help < CommandsBase
        def main
            help = <<EOF
Available commands

sd info  - account info

sd projects  - projects list for current user
sd project pr_id - project info
sd project.create  - create a project from with source code from current folder
sd project.servers pr_id - servers list for project pr_id
sd project.launch_server pr_id  - launch new server in project pr_id
sd project.databases pr_id  - list of databases in project pr_id
sd project.load_balancer pr_id  - load balancer in project pr_id
sd project.deploy_folder pr_id  - deploy current folder content in all servers of project pr_id
sd project.deploy pr_id  - deploy latest code to all servers of project pr_id

sd server server_id - server status of server_id server
sd server.reboot server_id - reboot server server_id
sd server.terminate server_id - terminate server server_id
EOF
            # help.each_line{|l| p l}
            print help
        end
    end
end
