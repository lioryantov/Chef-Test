#
# Cookbook Name:: iisinstall
# Recipe:: NotepaddCleanInstall.rb
#
# Copyright (c) 2015, AT&T Interwise, Lior Yantovski, ly107h@att.com
#
#  All Rights Reserved.
#
#Install Clean ACS Server software using windows_package
#

#def directory_exists?(directory)
#  File.directory?(directory)
#end

#if directory_exists?("D:\\Install Sources")
#	file "D:\\Install Sources\\run.log" do
#	content "Directory D:\\Install Sources exist"
#	action :create
#	end
# else directory 'D:\\Install Sources\\' do
	# action :create
	# end
#end

# file 'D:\\Install Sources\run.log' do
	# content "Directory D:\\Install Sources\\run.log will be created now"
	# action :create
	# end

batch 'copy ACS version to D:\Install Sources' do
  	code <<-EOH 
	md "D:\Install Sources"
#	xcopy C:\\chef\\cache\\cookbooks\\iisinstall\\files "D:\\Install Sources" /E /Y
#	xcopy "D:\\Install Sources\\inifile\\inifile.exe" "D:\\Install Sources\\11.7.209.70\\Pack\\" /E /Y
#	del "D:\\Install Sources\\11.7.209.70\\Pack\\InstallParams.ini"
#	xcopy "D:\\Install Sources\\inifile\\InstallParams.ini" "D:\\Install Sources\\11.7.209.70\\Pack\\" /E /Y
	EOH
end

powershell_script 'Copy Package to D:\\Install Sources' do
  code <<-EOH
	Copy-Item C:\\chef\\cache\\cookbooks\\iisinstall\\files D:\\Install Sources
	EOH
end

#batch 'Update InstallParams.ini file for ACS Clean Install' do
#  	code <<-EOH 
#	cd /d "D:\\Install Sources\\11.7.209.70\\Pack\\"
#	inifile.exe InstallParams.ini [SERVER] ISM_URL=https://sism.ucilab.com/ism
#	inifile.exe InstallParams.ini [Credentials] CA_ISM_Username=someUser
#	inifile.exe InstallParams.ini [Credentials] CA_ISM_Password=somePassword	
#	EOH
#end

#windows_package "Install ACS from clean" do
#	source File.join("D:", "Install Sources", "11.7.209.70", "Pack", "setup.exe")
#	source 'D:\\Install Sources\\11.7.209.70\\Pack\\setup.exe'
#	installer_type :custom
#	action :install
#	options '-silent'
#	end

#windows_package "Install ACS from clean" do
#  source "file://D://Install Sources//11.7.209.70//Pack//setup.exe"
#  action :install
#  installer_type :installshield
#  options "-silent"
#end

#batch 'Run ACS Clean Install in silent mode with predefined parameters' do
#	code <<-EOH
#	cd /d "D:\\Install Sources\\11.7.209.70\\Pack\\"
#	setup.exe -silent
#	if not exist %temp%\\ACSSetupSuccessful.txt goto end_with_error
#	if exist %temp%\\ACSSetupSuccessful.txt goto end_with_success
#	:end_with_error
#	exit /b 1
#	:end_with_success
#	exit /b 0	
#	EOH
#end



