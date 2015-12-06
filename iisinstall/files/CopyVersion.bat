REM ===========================================================================================================
REM Copying installation directory from mika 10.10.4.10
REM ===========================================================================================================
md "D:\Install Sources"
net use z: \\10.10.4.10\Versions\DevBuilds\V11.7\Sprint9\ACS /user:interwise\lyantovski Marina1911!
xcopy z:\* "D:\Install Sources" /E /Y
