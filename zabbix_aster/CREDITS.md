https://serveradmin.ru/monitoring-asterisk-v-zabbix/


cp zabbix_agentd.d/asterisk.conf /etc/zabbix/zabbix_agentd.d/asterisk.conf 
mkdir -p /etc/zabbix/scripts
cp scripts/asterisk.trunk-with-name.sh /etc/zabbix/scripts/asterisk.trunk-with-name.sh
chmod a+x /etc/zabbix/scripts/asterisk.trunk-with-name.sh

systemctl restart zabbix-agent

zabbix_agentd -t asterisk.asterisk_status
zabbix_agentd -t asterisk.fail2ban_chain
zabbix_agentd -t asterisk.trunk
