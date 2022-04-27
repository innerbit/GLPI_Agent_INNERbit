@ECHO off
REM - Executar como Administrador
REM     if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
REM        echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
REM )
REM Cliente
	:start 
		CLS 
		echo Backup v17
		echo.
		date /t
		echo Computador: %computername% Usuario: %username% 
		echo.
		echo Menu Principal de Backup
		echo.
		echo FastCopy 
		echo.
		echo ====================
		echo 1. Instalacao via MSI
		echo 2. Instalacao via VBS
		echo.
		echo 0. Voltar para Menu Principal
		echo ====================
		echo.
		set /p choice="Escolha sua opcao: " 
			if "%choice%"=="1" goto submenu_1 
			if "%choice%"=="2" goto submenu_2 
			if "%choice%"=="0" goto start

		:submenu_1
				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            BAIXANDO GLPI Agent                    #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					bitsadmin /transfer C:\Windows\Temp /priority normal https://github.com/glpi-project/glpi-agent/releases/download/1.2/GLPI-Agent-1.2-x64.msi C:\Windows\Temp\GLPI-Agent-1.2-x64.msi
		
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
				echo #            Instalando GLPI Inventory            #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.   
					C:\Windows\Temp\GLPI-Agent-1.2-x64.msi /quiet SERVER=https://innerbit.dyndns.info/glpi/front/inventory.php RUNNOW=1 ADDLOCAL=ALL ADD_FIREWALL_EXCEPTION=1 DEBUG=level HTML=1 TAG=%empresa% TASKS="" LOCAL=C:\Tools\
					pause
			REM Instalar Fusion

				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            GLPI Inventory Instalado             #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #              Abrir GLPI Status                    #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					start "Chrome" chrome --new-window http://localhost:62354
			pause
		:submenu_2
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
				echo #            Instalando GLPI Inventory            #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.   
					cscript glpi-agent-deployment.vbs
			REM Instalado
				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            GLPI Inventory Instalado             #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #              Abrir GLPI Status                    #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					start "Chrome" chrome --new-window http://localhost:62354

