REM ===========================================================================================================
REM Replacing InstallParams.ini file with environment settings + start running setup.exe in silent mode +reboot
REM ===========================================================================================================
if  exist %temp%\ACSSetupSuccessful.txt del %temp%\ACSSetupSuccessful.txt
del "D:\Install Sources\11.7.209.70\Pack\InstallParams.ini"
xcopy C:\chef\cache\cookbooks\iisinstall\files\inifile\InstallParams.ini "D:\Install Sources\11.7.209.70\Pack\" /E /Y
cd /d "D:\Install Sources\11.7.209.70\Pack\"
setup.exe -silent
if not exist %temp%\ACSSetupSuccessful.txt goto end_with_error
if exist %temp%\ACSSetupSuccessful.txt goto end_with_success

:end_with_error
echo Failed to complete Installtion
exit /b 1

:end_with_success
echo Completed Installtion, Going to Restart Server in 10 seconds
shutdown -r -f -t 10	
exit /b 0
