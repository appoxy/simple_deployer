module SimpleDeployer::Command
    class CommandsBase
        def initialize(args, service)
            @args = args
            @service = service
        end


        private
        def upload(file)
            f = File.open(file, "r")
            data = ''
            f.each_line do |line|
                data += line
            end
            @service.config.s3_bucket.put(File.basename(file), data)
        end


        def package(path)
            require 'zip/zip'
            path.sub!(%r[/$], '')
            archive = File.join(path, File.basename(path))+'.zip'
            FileUtils.rm archive, :force=>true
            Zip::ZipFile.open(archive, 'w') do |zipfile|
                Dir["#{path}/**/**"].each do |file|
                    zipfile.add(file.sub(path+'/', ''), file)
                end
            end
            return archive
        end


        def get_project
            @pr_id = @args.empty? ? @service.config.project_id : @args[0]
            raise "You should define project id" unless @pr_id
        end


        def get_server
            @server_id = @args ? @args[0] : nil
            raise "You should define server id" unless @server_id
        end

    end
end