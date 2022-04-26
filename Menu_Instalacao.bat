@ECHO off
REM - Executar como Administrador
REM     if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
REM        echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
REM )
REM Cliente
	cls
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #            NOME DA EMPRESA/CLIENTE?               #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		set /p empresa="Empresa/Cliente: " 
		echo %empresa%
REM Instalar Fusion
	cls
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #            Instalando Fusion Inventory            #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.   
        cscript Fusion-Inventory.vbs
REM Instalar Fusion
	cls
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #            Fusion Inventory Instalado             #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
REM Copiar arquivo do anydesk
	cls
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #            Copiando Arquivo do AnyDesk para       #
    echo #                   FusionInventory                 #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
        robocopy anydesk\ *AnyDesk.pm* C:\Tools\
        xcopy C:\Tools\AnyDesk.pm "C:\Program Files\FusionInventory-Agent\perl\agent\FusionInventory\Agent\Task\Inventory\Generic\Remote_Mgmt" /f /l /-y
        explorer C:\Program Files\FusionInventory-Agent\perl\agent\FusionInventory\Agent\Task\Inventory\Generic\Remote_Mgmt
	cls
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #            Arquivo AnyDesk Copiado                #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
    	cls
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #              Abrir Fusion Status                  #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
        start "Chrome" chrome --new-window http://localhost:62354
pause