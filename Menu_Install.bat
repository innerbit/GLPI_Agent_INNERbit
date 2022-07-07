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
					if exist "%PROGRAMFILES%\FusionInventory-Agent" (
						"%programfiles%\FusionInventory-Agent\Uninstall.exe" /S
					)

					\\verdanadesk.local\netlogon\glpiagent\glpiagentinstall.vbs

					reg add hklm\software\GLPI-Agent /v server /t REG_SZ /d https://innerbit.dyndns.info/glpi/front/inventory.php /f

					reg add hklm\software\GLPI-Agent /v httpd-trust /t REG_SZ /d 127.0.0.1/32 /f
					reg add hklm\software\GLPI-Agent /v tag /t REG_SZ /d %empresa% /f
					reg add hklm\software\GLPI-Agent /v delaytime /t REG_SZ /d 300 /f
					reg add hklm\software\GLPI-Agent /v force /t REG_SZ /d 1 /f

					net stop glpi-agent
					net start glpi-agent

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
