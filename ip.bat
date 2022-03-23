set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@ECHO off
cls
ECHO "Naskrobane przez: Patryk Kolek:"
:start
ECHO.
ECHO 1. pula 0.1 Static IP 
ECHO 2. pula 1.1 Static IP 
ECHO 3. wpisz wlasna adresacje IP 
ECHO 4. DHCP 
ECHO 5. Exit
set choice=
set /p choice=Wybierz jedna z opcji....
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto con3
if '%choice%'=='4' goto autosearch
if '%choice%'=='5' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:con1
ECHO Zmieniam ustawienia karty sieciowej na pule "192.168.0.XXX"
netsh interface ip set address "Ethernet" static 192.168.0.254 255.255.255.0 192.168.0.1 1
goto bye

:con2
ECHO Zmieniam ustawienia karty sieciowej na pule "192.168.1.XXX"

netsh interface ip set address "Ethernet" static 192.168.1.254 255.255.255.0 192.168.1.1 1
goto bye

:con3
echo "Podaj adres IP:"
set /p IP_Addr=

echo "Brama Domyslna:"
set /p D_Gate=

echo "Zmieniam ustawienia karty sieciowej..."
netsh interface ip set address "Ethernet" static %IP_Addr% 255.255.255.0 %D_Gate% 1
goto bye

:autosearch
ECHO przelaczam karte w tryb DHCP
netsh interface ip set address "Ethernet" dhcp
goto bye

:bye
ECHO OK
netsh interface ip show addresses "Ethernet"
pause
cls
echo "USTAWIENIA TWOJEJ KARTY SIECIOWEJ"
netsh interface ip show addresses "Ethernet"
echo .
echo WYBIERZ CO CHCESZ ZROBIC :
goto start

:end