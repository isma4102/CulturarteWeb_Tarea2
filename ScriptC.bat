@echo off
setlocal enabledelayedexpansion
:reader
set c=0
for /f "tokens=2 delims==" %%a in (web\config.properties) do (
set /a c+=1
call set lin!c!= %%a
)

mkdir build\web
cd build\web

xcopy /s /y ..\..\web\* .
xcopy /s /y ..\..\lib\* WEB-INF\lib\

mkdir WEB-INF\classes\
mkdir ..\generated-sources\
cd ..\generated-sources\


REM 
set lin1=%lin1: =%
set lin2=%lin2: =%
set lin3=%lin3: =%
set lin4=%lin4: =%
set lin5=%lin5: =%
set lin6=%lin6: =%
set lin7=%lin7: =%
set lin8=%lin8: =%

wsimport -keep -Xnocompile -p servicios http://%lin2%:%lin1%/servicio%lin3%?wsdl
wsimport -keep -Xnocompile -p servicios http://%lin2%:%lin1%/servicio%lin4%?wsdl
wsimport -keep -Xnocompile -p servicios http://%lin2%:%lin1%/servicio%lin5%?wsdl
wsimport -keep -Xnocompile -p servicios http://%lin2%:%lin1%/servicio%lin6%?wsdl
wsimport -keep -Xnocompile -p servicios http://%lin2%:%lin1%/servicio%lin7%?wsdl
wsimport -keep -Xnocompile -p servicios http://%lin2%:%lin1%/servicio%lin8%?wsdl

cd ..\..\
javac -cp "lib\*" -d .\build\web\WEB-INF\classes\ .\src\java\clases\*.java .\src\java\ControladorServlet\*.java .\build\generated-sources\servicios\*.java

xcopy ../../configW.properties web\
cd build\web
jar cvf ..\..\CulturarteWeb.war .

cd ..\..\
rd /s /q build

pause
endlocal
exit