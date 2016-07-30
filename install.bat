
set BINPATH=%1
set SERVICE_NAME=%2
set SERVICE_DISPLAY=%3
set SERVICE_DESCRIPTION=%4

cd %binPath%
call service.bat install //%SERVICE_NAME%

sc config %SERVICE_NAME% DisplayName= %SERVICE_DISPLAY% 
sc description %SERVICE_NAME% %SERVICE_DESCRIPTION%

:: Additional stuff (by now the service is already created)

::removes the double quote marks from the variables
set exePath=%BINPATH:"=%\%SERVICE_NAME:"=%
echo exePath is %exePath%

:: update the default settings to 256MB of Initial & Maximum memory pool size, and Service startup mode to be auto
"%exePath%" //US//%SERVICE_NAME% --JvmMs=256 --JvmMx=256 --Startup=auto

::set exeFile=%exePath:"=%.exe
::echo exeFile is %exeFile%
set wrapperFile=%exePath:"=%w.exe
echo wrapperFile is %wrapperFile%

"%wrapperFile%" //ES//%SERVICE_NAME% ::opens the wrapper file