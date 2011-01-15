module SimpleDeployer::Command

    class Info < CommandsBase

        def main
            puts "Account info"
            p "Access_key " + @service.config.access_key
            p "Secret_key " + @service.config.secret_key
            p "Aws_access_key " + @service.config.aws_access_key
            p "Aws_secret_key " + @service.config.aws_secret_key
            p "Current project id " + (@service.config.project_id || "Undefined")
        end
    end
end
