Procedimento para executar um script quando é disparado uma trigger


---Linux - Habilitar o system.run e dar permissão de execução para o usuario zabbix, no zabbix agent do host

1- No arquivo de configuração do Zabbix Agent (/etc/zabbix/zabbix_agentd.conf), descomentar a linha AllowKey=system.run[*]
<img width="891" height="192" alt="image" src="https://github.com/user-attachments/assets/5d1e5155-ec72-41ea-a100-43c7cb92163b" />


2 - Reiniciar o serviço do Zabbix Agent

systemctl restart zabbix-agent

    
3 - Adicionar o usuario Zabbix como sudo

visudo

Adicionar a linha: zabbix ALL=NOPASSWD: ALL

<img width="540" height="79" alt="image" src="https://github.com/user-attachments/assets/c6212182-0b42-4d07-a1d2-66ce322dee58" />

<br>
<br>

---Windows - Habilitar o system.run

1 - No arquivo de configuração do Zabbix Agent (C:\zabbix_agent\conf\zabbix_agentd.conf), adicionar a linha AllowKey=system.run[*]

<img width="908" height="173" alt="image" src="https://github.com/user-attachments/assets/c7b906a3-0676-416b-a683-0fe680f32911" />

2 - Reiniciar serviço do Zabbix Agent

<img width="258" height="246" alt="image" src="https://github.com/user-attachments/assets/b0f64d01-45aa-4477-8e44-ea655a14e640" />

<br>
<br>
<br>

---Na Console do Zabbix, acessar:

-Alerts > Scripts > Create Script

Exemplo:

<img width="1037" height="488" alt="image" src="https://github.com/user-attachments/assets/dff9a2bf-ce35-4275-b358-98e28213f0d7" />


-Alerts > Action Triggers > Criar a action

Exemplo:

<img width="1039" height="316" alt="image" src="https://github.com/user-attachments/assets/014246eb-3ed9-4f42-b266-39a78d7d8d6a" />


<img width="1038" height="472" alt="image" src="https://github.com/user-attachments/assets/07e80ac4-6bc5-40e6-8058-bb8207fd60fb" />

