Como monitorar sua Azure via API

Acesse seu ambiente da Azure e execute o comando abaixo, via Cloud Shell, alterando para sua Subscription ID
<br>
<br>
<img width="1145" height="51" alt="image" src="https://github.com/user-attachments/assets/602e4dd3-af4f-4ccf-9a22-a30ccebfd024" />
<br>
<br>
az ad sp create-for-rbac --name zabbix --role reader --scope /subscriptions/<subscription_id>
<br>
<br>
<br>
Crie o host e adicione o template Azure by HTTP
<img width="1039" height="542" alt="image" src="https://github.com/user-attachments/assets/d2872c4f-7af9-4a7d-8a67-693bc96a6c7a" />
<br>
<br>
<br>
Em Macros, adicione essas macros e seus valores de acordo com o resultado do comando executado no Cloud Shell
<img width="1036" height="335" alt="image" src="https://github.com/user-attachments/assets/66530a83-ece4-453e-b8e4-980faacc83d5" />
<br>
<br>
<br>
Documentação Oficial:
https://www.zabbix.com/integrations/azure
