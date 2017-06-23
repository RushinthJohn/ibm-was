#
# Cookbook:: ibm-was
# Recipe:: appsample
#
# Copyright:: 2017, Rushinth John, All Rights Reserved.

directory '/opt/IBM/tmp/app' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

cookbook_file '/opt/IBM/tmp/app/DefaultServletEngine.zip' do
  source 'DefaultServletEngine.zip'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'Unzip Sample App to server Directory' do
  command 'unzip DefaultServletEngine.zip -d /opt/IBM/WebSphere/Liberty/usr/servers'
  cwd '/opt/IBM/tmp/app'
  action :run
  not_if 'ls /opt/IBM/WebSphere/Liberty/usr/servers | grep Default'
end

execute 'Run Sample App' do
  command './server start DefaultServletEngine'
  cwd '/opt/IBM/WebSphere/Liberty/bin'
  action :run
  not_if '/opt/IBM/WebSphere/Liberty/bin/server status DefaultServletEngine'
end
