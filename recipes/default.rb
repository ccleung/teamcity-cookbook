include_recipe "teamcity::server"
include_recipe "teamcity::build_agent"
include_recipe "teamcity::plugins"

%w(/lib /lib/jdbc).each do |path|
  directory "#{node['teamcity_server']['data_dir']}/#{path}" do
    owner node['teamcity_server']['user']
    group node['teamcity_server']['group']
    mode '0755'
    action :create
  end
end

remote_file "#{node['teamcity_server']['data_dir']}/lib/jdbc/postgresql-9.4-1201.jdbc41.jar" do
  source 'https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc41.jar'
end
