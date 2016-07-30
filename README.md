
# INSTALL MULTIPLE TOMCAT INSTANCES IN WINDOWS SERVER
This tutorial explains how to install multiple tomcat instances on a Windows machine. 

### USAGE
	Execute with admin privileges the following command: install.bat "BINPATH" "SERVICE_NAME" "SERVICE_DISPLAY"  "SERVICE_DESCRIPTION"

### Ensure
 * The service.bat is present in /bin
 * JAVA_HOME and JRE_HOME environmental variables are present
 * You rename the bin/tomcat7.exe and bin/tomcat7w.exe to the desired windows service name. (see example below)
 * The renamed file name will match the 2nd arg of install.bat (i.e. SERVICE_NAME)
 * You replace all occurences of %CATALINA_HOME%\bin\{currentServiceName}.exe in bin/service.bat with the desired windows service name. (see example)
 * You change the ports in conf/server.xml to unused ones

### Example (On fresh tomcat installation and default service.bat)
 * Rename the bin/tomcat7.exe to bin/ProjName-Tomcat7.exe
 * Rename the bin/tomcat7w.exe to bin/ProjName-Tomcat7w.exe
 * Replace all occurences of "%CATALINA_HOME%\bin\tomcat7.exe" with "%CATALINA_HOME%\bin\ProjName-Tomcat7.exe"
 * install.bat "C:\Apache\Tomcat 7.0\bin" "ProjName-Tomcat7" "ProjName-Tom7" "The description"

### Service startup errors
 * Execute wrapper file (i.e. ProjName-Tomcat7w.exe) manually and in Logging section do the following:
    * Change level of logging to debug and set a log path
    * Force the startup error again and read the log