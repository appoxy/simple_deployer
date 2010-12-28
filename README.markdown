Simple_deployr allows to use SimpleDeployr.com from the command line
========================================================

This library wraps the REST API for managing and deploying Rails apps to the
SimpleDeployr.  It can be called as a Ruby library, or invoked from the
command line.  Code push and pull is done through Amzon S3.

For more about SimpleDeployr see <http://simpledeployr.com>.


Setup
-----

	1. install SD gem  - sudo gem install simple_deployr
	2. type sd in command line

List of available commands
-------------------------
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



Sample workflow

1) create project - “sd project.create”

2) launch server -  “sd project.launch_server”   (you can omit pr_id parameter - by default it’s current project) id

3) Deploy latest code from current folder - “sd project.deploy_folder”

4) Terminate server - “sd server.terminate server_id ” where server_id you can get from step 2