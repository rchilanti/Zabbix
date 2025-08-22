Monitorar o VMware ESXi via template padrão VMware Hypervisor

Configuração do host
<img width="1046" height="468" alt="image" src="https://github.com/user-attachments/assets/ee51f0ed-39f8-413d-8bd9-56c5726f85f8" />


---Macros que devem ser configuradas no Template padrão VMware Hypervisor

{$VMWARE.HV.UUID}

{$VMWARE.URL}

{$VMWARE.USERNAME}

{$VMWARE.PASSWORD}

Para capturar o UUID do ESXI, acesse o ESXI via SSH e executar o comando:

vim-cmd hostsvc/hostsummary | grep uuid

<img width="1038" height="375" alt="image" src="https://github.com/user-attachments/assets/621130be-f5dd-47d7-9245-81f8092bc6e1" />



---Itens e Triggers Personalizados

Você vai precisar capturar o UUID da VM que deseja monitorar.

Acesse o ESXI via SSH e executar o comando (alterando para o caminho completo da sua VM):

cat /vmfs/volumes/datastore1/WinServer2022/WinServer2022.vmx | grep uuid.bios

ajuste o formato do UUID para o padrão RFC 4122:

xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

---Item Personalizado Estado da VM--- (Verifica se a VM está ligada ou desligada)

Key: vmware.vm.state[{$VMWARE.URL},564dd80e-a288-dd08-ffbd-96a9a65b417f]

Altere para a UUID da sua VM

<img width="1031" height="419" alt="image" src="https://github.com/user-attachments/assets/9291810b-4ba0-46cc-9d40-7cf03c78bdf0" />



---Trigger Personalizada Estado da VM--- (Alerta se a VM está desligada)

Expression: last(/VDTC001/vmware.vm.state[{$VMWARE.URL},564dd80e-a288-dd08-ffbd-96a9a65b417f])="notRunning"

Altere para a UUID da sua VM

<img width="1042" height="506" alt="image" src="https://github.com/user-attachments/assets/f4ec1415-39f8-4eb0-b247-5221306d4d92" />



---Item Personalizado do status do VMware Tools--- (Verifica se o VMwareTools está em execução)

Key: vmware.vm.tools[{$VMWARE.URL},564dd80e-a288-dd08-ffbd-96a9a65b417f,status]

Altere para a UUID da sua VM

<img width="1035" height="467" alt="image" src="https://github.com/user-attachments/assets/2e203a4f-f329-4ae3-9808-bb3cca36944f" />



---Trigger Personalizada do status do VMware Tools--- (Alerta se o VMwareTools está em execução)

Expression: last(/VDTC001/vmware.vm.tools[{$VMWARE.URL},564dd80e-a288-dd08-ffbd-96a9a65b417f,status])="guestToolsnotRunning"

Altere para a UUID da sua VM

<img width="1046" height="466" alt="image" src="https://github.com/user-attachments/assets/857c7d31-8ea5-41a4-98e9-88347934f776" />
<br>
<br>
<br>
Documentação Oficial:

https://www.zabbix.com/documentation/7.0/en/manual/vm_monitoring/vmware_keys


