#
# Cookbook Name:: iisinstall
# Recipe:: ACSCleanInstall2.rb
#
# Copyright (c) 2015, AT&T Interwise, Lior Yantovski, ly107h@att.com
#
#  All Rights Reserved.
#
#Install Clean ACS Server software using running batch files
#

batch 'Copy ACS version to D:\Install Sources from 10.10.4.10' do
	cwd 'C:\\chef\\cache\\cookbooks\\iisinstall\\files'
	code "CopyVersion.bat"
	action :run
end

batch 'Replacing InstallParams.ini file + running setup.exe in silent mode' do
	cwd 'C:\\chef\\cache\\cookbooks\\iisinstall\\files'
	code "InstallVersion.bat"
	action :run
end


