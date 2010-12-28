module SimpleDeployr::Command

    class Projects < CommandsBase

        def main
            projects = @service.projects_list()
            projects.each do |pr|
                p "Name:" + pr["name"] + "; id:" + pr["id"] + "; active servers:"+pr["num_servers"].to_s
            end
        end
    end
end

