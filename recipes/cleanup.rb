#
# Cookbook:: ibm-was
# Recipe:: cleanup
#
# Copyright:: 2017, Rushinth John, All Rights Reserved.

directory '/opt/IBM/tmp' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :delete
end
