SERVIDOR UTILIZADO = Ubuntu 14.04 (o mais compativel com Otserv)

Instale o "Bitvise" para ter conexão com a máquina e poder transferir os arquivos facilmente

-----------------

// CONFIGURANDO SENHA PARA SEU ROOT | USER \\
Caso seu usuário/root não possua senha, digite:
$ sudo su
# passwd root
// onde "root" pode ser substituido pelo usário no qual você quer setar a senha
//Agora seu ROOT já possui senha

// Mude a porta do seu SSH para sua segurança
nano /etc/ssh/sshd_config
//----------------------------------------------------------------------------------
//-- PROCURE PELO PORT 22
//-- Mude o 22 para a porta que você quer, assim ninguém poderá ter acesso além de você       -  RECOMENDO 1295
//----------------------------------------------------------------------------------

service ssh restart

--------------

// PARA USUÁRIOS NÃO ROOT //
Caso você entre em um usuário não ROOT, use o comando "sudo su" ou "su" para ter acesso ROOT!

-------------------------------

// Mude o horário da máquina para São Paulo
// Primeiro, vamos checar se o horário está do Canadá ou outro...
date

// Se não tiver no horário do Brasil, use os comandos abaixo
cd /usr/share/zoneinfo

tzselect

// Escolha por números... Americas, Brazil, Brazil (southeast: ...   Em seguida, 1 para yes
// Após isso, grave na sua mente a localização "America/Sao_Paulo" - EXEMPLO
// Fazer um backup do localtime atual
mv /etc/localtime /etc/localtime.orig

// Fazendo um Link do novo horário para o localtime
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

// Agora vamos checar o novo horário
date

-----------------------------

1 // Caso seja necessário liberar as portas

iptables -A INPUT -p tcp --dport 7171 -j ACCEPT
iptables -A INPUT -p tcp --dport 7172 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 8090 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 4499 -j ACCEPT
iptables -A INPUT -p tcp --dport 8245 -j ACCEPT
iptables -A INPUT -p tcp --dport 7173 -j ACCEPT
//Não esqueça de liberar as portas do SSH


// Caso seu servidor possua SHELL(estilo Google Cloud ou - Firewall por shell... Acesse o SHELL e utilize os comandos abaixo
gcloud compute firewall-rules create allow-http --description "incoming http allowed." \
		--allow tcp:80 --format json
		
gcloud compute firewall-rules create allow-oito --description "incoming http allowed." \
		--allow tcp:8090 --format json
		
gcloud compute firewall-rules create allow-sete --description "incoming http allowed." \
		--allow tcp:7171 --format json

gcloud compute firewall-rules create allow-dois --description "incoming http allowed." \
		--allow tcp:7172 --format json
		
gcloud compute firewall-rules create allow-treis --description "incoming http allowed." \
		--allow tcp:7173 --format json
		
gcloud compute firewall-rules create allow-trest --description "incoming http allowed." \
		--allow tcp:3306 --format json
		
gcloud compute firewall-rules create allow-quatro --description "incoming http allowed." \
		--allow tcp:443 --format json
		
gcloud compute firewall-rules create allow-nove --description "incoming http allowed." \
		--allow tcp:4499 --format json
//Não esqueça de liberar as portas do SSH
		
------------------------

2 // É necessário atualizar a máquina e a segurança dela com o comando abaixo

apt-get update && apt-get upgrade

---------------------------

3 // Instalando Nginx

apt-get install nginx

service nginx start

// Use esse comando para saber quantos CPUS a máquina possui, para modificar uma arquivo no NGINX
lscpu

// Após saber quantos CPUS a máquina possui, edite o nginx.conf
// Em "worker_processes"   -- Trocar pela quantidade que a maquina possui
// LEMBRNADO QUE: Para salvar arquivo = CTRL + X, dar Y e ENTER
// OBS: Caso esteja worker_processes auto; - Não mexa, apenas feche
nano /etc/nginx/nginx.conf

// Caso tenha feito a configuração acima, modificando algo, use o comando abaixo ou pule este comando
service nginx restart

----------------------------

4  // Vamos criar uma pasta default.old e mover o arquivo default do nginx
mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old

// Vamos agora criar um novo documento default para o nginx
nano /etc/nginx/sites-available/default

/* ADICIONE

#EDITED BY KOLISAO
server {
	listen 80;
	server_name your_site_name.com__or__ip_da_maquina;
	root /usr/share/nginx/html;
	index index.php index.html index.htm index.nginx-debian.html;

	location / {
		try_files $uri $uri/ =404;
	}

	error_page 404 /404.html;
	error_page 500 502 503 504 /50x.html;

	location = /50x.html {
		root /usr/share/nginx/html;
	}

	location ~ \.php$ {
		try_files $uri =404;
#		fastcgi_pass 127.0.0.1:9000;
		fastcgi_pass unix:/var/run/php5-fpm.sock;
		fastcgi_index index.php;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		include fastcgi_params;
	}
	
	location ~ /\.ht {
		deny all;
	}
		
	location /phpmyadmin {
		allow YOUR_IP_TO_ACESS_DB;
		allow 127.0.0.1;
		deny  all;
	}
}

*/


// Usar os 2 comandos abaixo para verificar se ortografica está correta e dar restart no nxing para salvar as alterações
nginx -t

service nginx restart

--------------------------

5 // Instalando MAriaDB - Database
apt-get install mariadb-server mariadb-client

// Checar se foi instalado e está funcionando
service mysql status

--------------------------

6 // Instalando PHP5

apt-get install php5 php5-fpm php5-mysql

apt-get install php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl﻿

service nginx restart

// Abrir o php.ini
nano /etc/php5/fpm/php.ini
// Use CTRL + W e procure por cgi.fix_pathinfo=1     - tirar o ; no começo e mudar de 1 para 0

// Dar restart no PHP5 para salvar as configurações
service php5-fpm restart

-------------------------

7 // Vamos agora testar se o PHP está funcionando
nano /usr/share/nginx/html/info.php
// Adicione
/*

<?php
phpinfo();
?>

*/

------------------------

8 // Fazer algumas modificações no PHP
nano /etc/php5/fpm/pool.d/www.conf
// Use CTRL + W e procure por listen = /var/run/php5-fpm.sock     - tirar ; e modificar /var/run/php5-fpm.sock para 127.0.0.1:9000

// Para salvar as configurações
service php5-fpm restart

// Configurando no Nginx
nano /etc/nginx/sites-available/default
// Procure por  fastcgi_pass unix:/var/run/php5-fpm.sock     - Adicione # no começo dele para desabilita-lo
// Remova o # do fastcgi_pass 127.0.0.1:9000;           - Para habilita-lo

// Para salvar as configurações do Nginx
service nginx restart


-------------------------

9 // Instalando o PhpmyAdmin
apt-get install phpmyadmin
// Aperte TAB para ir ao ENTER quando a janela aparecer (assim, você não vai instalar o apache2)
// Se aparecer outra janela, marque a opção YES
// Caso apareça para configurar a senha, utilize a mesma q vc configurou no MariaDB, caso tenha configurado

// Agora vamos linkar o PhpMyAdmin para a página WWW
ln -s /usr/share/phpmyadmin/ /usr/share/nginx/html

// Para salvar as configurações
service nginx restart


--------------------------

10 // Adicionando seu SERVIDOR
// Primeiro, baixe o unzip caso não tenha
apt-get install unzip

//Adicione o servidor em /  Para facilitar na busca
mkdir /servidor
// Jogue seu servidor como .zip lá
//Após isso, use o comando
unzip servidor.zip

// CONFIGURE TEU SERVIDOR - DB

---------------------------

11 // Vamos adicionar e configurar o site
//OBS: Não delete o 50x.html
//adicione seu site em /usr/share/nginx/html

// CONFIGURE TEU SITE


//Adicionando as configurações no AJAX
> Vá até a pasta account e procure por:

ajax_accountname.php
ajax_charactername.php
ajax_email.php

Modifique a seguinte linha:
$conn = mysql_pconnect('localhost', 'root', 'senha') or die();


------------------------------

12 // Compilando o OTX 2.9
apt-get install git subversion autoconf build-essential pkg-config libboost-dev libgmp3-dev libxml2-dev liblua5.1-0-dev libmysqlclient-dev ccache libboost-filesystem-dev libboost-regex-dev libboost-system-dev libboost-thread-dev screen libssl-dev libboost-iostreams-dev



cd /servidor/sources

sh ./autogen.sh && ./configure --enable-server-diag --enable-mysql --enable-root-permission && make -j $(nproc)

mv theotxserver /servidor

cd /servidor

---------------------------

13 // Vamos agora criar um auto restart e auto Backup

// Criando uma pasta database_backup dentro da pasta do servidor
mkdir /servidor/database_backup

// Criando um documento para adicionar as configurações do restart
nano /servidor/restart.sh

// Adicionar no documento
/*

while true; do mysqldump YOUR_DATABASE_NAME | bzip2 -c > database_backup/backup$(date +%d-%m-%Y).sql.bz2 && ./theotxserver; done

*/

// Agora, para abrir o documento para ter acesso a database
nano ~/.my.cnf

// Adicionar no documento
/*

[mysqldump]
user=MYSQL_USER
password=MYSQL_PASS

*/

// Conceder permissão ao restart.sh
cd /servidor

chmod 755 restart.sh


-----------------------------

14 // Abrindo seu servidor...

// Vá até o local do servidor   --  cd /servidor
// Utilize sempre
screen ./restart.sh


// Para visualizar o servidor, utilize:
screen -x


// Para fazer atualização nas sources ou etc... entre no servidor, der /save e feche com CTRL + C no servidor
// para que ele não consiga abrir o serv novamente

// Caso precise fechar todos os THEOTXSERVER use o comando
killall -9 theotxserver