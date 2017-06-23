#
# Cookbook:: ibm-was
# Recipe:: default
#
# Copyright:: 2017, Rushinth John, All Rights Reserved.

directory '/opt/IBM/tmp/im' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

cookbook_file '/opt/IBM/tmp/im/agent.installer.linux.gtk.x86_64_1.8.zip' do
  source 'agent.installer.linux.gtk.x86_64_1.8.zip'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'Unzip IBM Installation Manager' do
  command 'unzip agent.installer.linux.gtk.x86_64_1.8.zip'
  cwd '/opt/IBM/tmp/im'
  action :run
  not_if 'ls /opt/IBM/tmp/im | grep installc'
end

execute 'Silent Install of IBM Installation Manager' do
  command './install -acceptLicense --launcher.ini silent-install.ini'
  cwd '/opt/IBM/tmp/im'
  action :run
  not_if 'ls /opt/IBM/InstallationManager/eclipse/tools/ | grep imcl'
end
