@ECHO off
REM - Executar como Administrador
REM     if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
REM        echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
REM )
REM Cliente
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
					set endereco=innerbit.dyndns.info
					GLPI-Agent-1.2-x64.msi /quiet SERVER="https://%endereco%/glpi/front/inventory.php, https://%endereco%/marketplace/glpiinventory/" RUNNOW=1 ADDLOCAL=ALL ADD_FIREWALL_EXCEPTION=1 DEBUG=level HTML=1 TAG=%empresa% TASKS="" LOCAL=C:\Tools\
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
