#
# Cookbook:: ibm-was
# Recipe:: wasinst
#
# Copyright:: 2017, Rushinth John, All Rights Reserved.

directory '/opt/IBM/tmp/was' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

cookbook_file '/opt/IBM/tmp/was/com.ibm.websphere.liberty.ND_17.0.2.20170523_1818.zip' do
  source 'com.ibm.websphere.liberty.ND_17.0.2.20170523_1818.zip'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'Unzip IBM WAS ND Liberty v8.5.5' do
  command 'unzip com.ibm.websphere.liberty.ND_17.0.2.20170523_1818.zip'
  cwd '/opt/IBM/tmp/was'
  action :run
  not_if 'ls /opt/IBM/tmp/was/com.ibm.websphere.liberty.ND_17.0.2.20170523_1818 | grep repo'
end

execute 'Install IBM WAS ND Liberty v8.5.5' do
  command './imcl -acceptLicense install com.ibm.websphere.liberty.ND_17.0.2.20170523_1818 -repositories /opt/IBM/tmp/was/com.ibm.websphere.liberty.ND_17.0.2.20170523_1818'
  cwd '/opt/IBM/InstallationManager/eclipse/tools/'
  action :run
  not_if 'ls /opt/IBM/WebSphere/Liberty | grep bin'
end
