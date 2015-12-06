#
# Cookbook Name:: iisinstall
# Recipe:: default
#
# Copyright 2015, Interwise, Lior Yantovski ly107h@att.com
#
# Copyright (c) 2014 SCC, All Rights Reserved.
#
service 'w3svc' do
  action [:stop, :disable]
end

powershell_script 'IIS Remove Fatures' do
  code <<-EOH
	Import-Module Servermanager
	Remove-WindowsFeature Web-Mgmt-Console
  	Remove-WindowsFeature Web-Server -restart
	EOH
  guard_interpreter :powershell_script
end
