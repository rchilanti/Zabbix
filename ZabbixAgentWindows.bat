@echo off
set "hostsFile=C:\Temp\ZabbixAgent\Hosts_ZabbixAgent.txt"

:: Loop por cada hostname/IP do arquivo
for /f "tokens=*" %%H in (%hostsFile%) do (
    echo Processando o host %%H...

    REM Cria pasta Temp\zabbix_agent no destino
	echo Criando pasta zabbix_agent...
    C:\Temp\PSTools\PsExec64.exe \\%%H cmd /c "mkdir c:\zabbix_agent\"
	timeout /t 5 /nobreak


    REM Copia o zabbix_agent para a pasta do destino
	echo Copiando PastaZIP do zabbix_agent...
    copy /B /Y C:\Temp\ZabbixAgent\zabbix_agent.zip \\%%H\c$\zabbix_agent\
    timeout /t 5 /nobreak
	
	
	REM Descompacta Zip
	echo Descompactando Zip do zabbix_agent...
	C:\Temp\PSTools\PsExec64.exe \\%%H cmd /c "tar -xf c:\zabbix_agent\zabbix_agent.zip -C c:\zabbix_agent\" >nul 2>&1
    timeout /t 5 /nobreak
	
	REM Adiciona Hostname no arquivo conf
	echo Adiciona Hostname no arquivo conf...
	C:\Temp\PSTools\PsExec64.exe \\%%H cmd /c "echo Hostname=%%H>> C:\zabbix_agent\conf\zabbix_agentd.conf" >nul 2>&1
	timeout /t 5 /nobreak

    REM Executa a instalação do zabbix_agent
	echo Instalando o zabbix_agent...
	C:\Temp\PSTools\PsExec64.exe \\%%H cmd /c "C:\zabbix_agent\bin\zabbix_agentd.exe -i -c C:\zabbix_agent\conf\zabbix_agentd.conf"
	timeout /t 5 /nobreak
	
	REM Inicia servico do zabbix_agent
	echo Iniciando o servico do zabbix_agent...
	C:\Temp\PSTools\PsExec64.exe \\%%H cmd /c "C:\zabbix_agent\bin\zabbix_agentd.exe --start"
    timeout /t 5 /nobreak

	REM Deleta o ZIP
	echo Deleta o ZIP
	C:\Temp\PSTools\PsExec64.exe \\%%H cmd /c "del c:\zabbix_agent\zabbix_agent.zip" >nul 2>&1

)

echo Finalizado.
pause
