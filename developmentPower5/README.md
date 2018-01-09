# modules for new power5 cluster

## smartd_health : 
add a smartd conf to run light tests every 12 H
then checks with crontab.daily for PASSED health result

in zabbix its : 	developmentPower5: smartd_health test where 1 is ok and 0 is disk failure.

## graylog module: 
 add graylog config to send syslog data to graylog.tau


