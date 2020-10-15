version: '3.3'
services:
   mysql:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: changeme
       MYSQL_DATABASE: zabbix
       MYSQL_USER: zabbix
       MYSQL_PASSWORD: zabbix_pwd

   zabbix:
     depends_on:
       - mysql
     image: zabbix/zabbix-server-mysql
     ports:
       - "8000:80"
     restart: always
     environment:
       DB_SERVER_HOST: mysql
       DB_SERVER_PORT: 3306
       MYSQL_USER: zabbix
       MYSQL_PASSWORD: zabbix_pwd

volumes:
    db_data: {}
    db_zabbix: {}
