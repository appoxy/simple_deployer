module SimpleDeployr::Command

    class Server < CommandsBase
        def main
            get_server
            p @service.server_status(@server_id)
        end


        def reboot
            get_server
            p @service.reboot_server(@server_id)
        end


        def terminate
            get_server
            p @service.terminate_server(@server_id)
        end

    end
end