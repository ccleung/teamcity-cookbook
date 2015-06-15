include_recipe "teamcity::server"
include_recipe "teamcity::build_agent"
include_recipe "teamcity::plugins"

remote_file "#{node['teamcity_server']['data_dir']}/lib/jdbc" do
  source 'https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc41.jar'
end
