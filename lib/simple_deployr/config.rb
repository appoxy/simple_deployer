module SimpleDeployr
    class Config
        attr_accessor :access_key,
                      :secret_key,
                      :aws_access_key,
                      :aws_secret_key,
                      :project_id,
                      :host


        def read
            credentials = read_from_file
            if credentials
                parse(credentials)
            else
                credentials = read_from_cli
                write_to_file(credentials)
                parse(credentials)
            end
        end


        def s3_bucket
            return s3.bucket(s3_bucket_name, true)
        end


        def s3
            Aws::S3.new(aws_access_key, aws_secret_key, {:connection_mode => :per_request})
        end


        def s3_bucket_name
            'sd_store'
        end


        def config_file
            Dir.pwd + "/.sd/config.yaml"
        end


        def save_config
            write_to_file({"access_key"=>self.access_key, "secret_key"=>self.secret_key, "aws_access_key"=>self.aws_access_key, "aws_secret_key"=>self.aws_secret_key, "project_id"=>self.project_id})
        end


        private
        def write_to_file(credentials)
            FileUtils.makedirs(File.dirname(config_file))
            File.open(config_file, 'w', 0755) {|f| f.write(credentials.to_yaml) }
        end


        def read_from_file
            File.exists?(config_file) and YAML.load_file(config_file)
        end


        def read_from_cli
            puts "Enter your SD credentials."
            print "Access Key: "
            access_key = gets.strip
            print "Secret Key: "
            secret_key = gets.strip
            print "AWS Access Key: "
            aws_access_key = gets.strip
            print "AWS Secret Key: "
            aws_secret_key = gets.strip
            return {"access_key"=>access_key, "secret_key"=>secret_key, "aws_access_key"=>aws_access_key, "aws_secret_key"=>aws_secret_key}
        end


        def parse(params={})
            self.access_key = params["access_key"]
            self.secret_key=params["secret_key"]
            self.aws_access_key=params["aws_access_key"]
            self.aws_secret_key=params["aws_secret_key"]
            self.project_id=params["project_id"] if params["project_id"]
        end
    end
end