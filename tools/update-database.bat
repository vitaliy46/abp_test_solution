@echo off
chcp 1251>nul
rem set start_red=0C
rem%start_red% "ERROR"

cd ..
set PathRoot=%cd%
echo PathRoot=%PathRoot%
set ok=true

set test.Entity="%PathRoot%\aspnet-core\src\test.EntityFrameworkCore"
set WebHost="%PathRoot%\aspnet-core\src\test.Web.Host\test.Web.Host.csproj"

call:doMigrate

:breake

IF %ok%==false  (
echo Что-то пошло не так, нужно пересоздать базу данных, введите пароль...
dropdb -h localhost -U postgres -W testdb
set ok=true
call:doMigrate
 ) ELSE (
echo good!!!!!!!) 


echo.&pause&goto:eof
------------------------------------------------

:doMigrate
cd %test.Entity%
echo Применяются миграции %test.Entity%
dotnet ef database update -s %WebHost%
IF %errorlevel% == 0  (
echo. command return: %errorlevel%
) ELSE (
set ok=false
goto:breake)  

goto:eof