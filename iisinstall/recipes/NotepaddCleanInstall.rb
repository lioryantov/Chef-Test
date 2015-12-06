#
# Cookbook Name:: iisinstall
# Recipe:: NotepaddCleanInstall.rb
#
# Copyright (c) 2015, AT&T Interwise, Lior Yantovski, ly107h@att.com
#
#  All Rights Reserved.
#
#Install Clean Notepadd++ using windows_package
#
#

directory 'D:\Install Sources' do
  action :create
end

#Download Notepadd++ 6.8.1 package
remote_file 'D:\Install Sources\npp.6.8.1.Installer.exe' do
  source 'https://notepad-plus-plus.org/repository/6.x/6.8.1/npp.6.8.1.Installer.exe'
  action :create
end

#Install Notepad++ latest release
windows_package "Notepad++" do
	source	'D:\Install Sources\npp.6.8.1.Installer.exe'
	action :install 
end