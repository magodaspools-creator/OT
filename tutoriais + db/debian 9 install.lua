apt-get update

apt-get upgrade -y



-- Mude o horário da máquina para São Paulo
-- Primeiro, vamos checar se o horário está do Canadá ou outro...
date

-- Se não tiver no horário do Brasil, use os comandos abaixo
cd /usr/share/zoneinfo

tzselect

-- Escolha por números... Americas, Brazil, Brazil (southeast: ...   Em seguida, 1 para yes
-- Após isso, grave na sua mente a localização "America/Sao_Paulo" - EXEMPLO
-- Fazer um backup do localtime atual
mv /etc/localtime /etc/localtime.orig

-- Fazendo um Link do novo horário para o localtime
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

-- Agora vamos checar o novo horário
date

-- Mude a porta do seu SSH para sua segurança
nano /etc/ssh/sshd_config
----------------------------------------------------------------------------------
-- PROCURE PELO PORT 22
-- Mude o 22 para a porta que você quer, assim ninguém poderá ter acesso além de você       -  RECOMENDO 1295
----------------------------------------------------------------------------------

service ssh restart


-- MUDE A SENHA Root
-- Assim, você ficará ainda mais protegido
passwd root

----------------------------------------------------------------------------------

apt-get -y install nginx

systemctl start nginx.service

apt-get -y install mariadb-server mariadb-client

mysql_secure_installation
----------------------------------------------------------------------------------
-- COLOQUE PASSWORD DO ROOT
-- DIGITE 'Y' E ENTER (Mudar password do ROOT mariaDB)
-- DIGITE O NOVO PASSWORD DO ROOT
-- DIGITE NOVAMENTE O PASSWORD DO ROOT
-- DIGITE Y E ENTER (Remover usuários anonymous)
-- DIGITE Y E ENTER (Disallow Root Login Remotely)
-- DIGITE Y E ENTER (Remover database test)
-- DIGITE Y E ENTER (Dar Reload nas tabelas)
----------------------------------------------------------------------------------

service mysql status

vim /etc/apt/sources.list.d/jessie.list 

----------------------------------------------------------------------------------
-- APERTE NO 'INSERT' EM SEU TECLADO E DIGITE

deb http://ftp.debian.org/debian/ jessie main contrib non-free
deb-src http://ftp.debian.org/debian/ jessie main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free

PARA SALVAR, APERTE 'ESC' E DPOIS ZZ  (EM MAIUSCULO)
----------------------------------------------------------------------------------

apt update

apt-get -y install php5 php5-fpm php5-mysql

mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old

nano /etc/nginx/sites-available/default

----------------------------------------------------------------------------------
-- ADICIONE

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

----------------------------------------------------------------------------------

nginx -t

systemctl reload nginx.service

nano /etc/php5/fpm/php.ini
----------------------------------------------------------------------------------
-- Use CTRL + W e procure por cgi.fix_pathinfo=1     - tirar o ; no começo e mudar de 1 para 0
----------------------------------------------------------------------------------

systemctl restart php5-fpm.service

nano /usr/share/nginx/html/info.php
----------------------------------------------------------------------------------
-- ADICIONE
<?php
phpinfo();
?>

----------------------------------------------------------------------------------

nano /etc/php5/fpm/pool.d/www.conf
----------------------------------------------------------------------------------
-- Use CTRL + W e procure por listen = /var/run/php5-fpm.sock     - tirar ; e modificar /var/run/php5-fpm.sock para 127.0.0.1:9000
----------------------------------------------------------------------------------

systemctl restart php5-fpm.service

nano /etc/nginx/sites-available/default
----------------------------------------------------------------------------------
-- Procure por  fastcgi_pass unix:/var/run/php5-fpm.sock     - Adicione # no começo dele para desabilita-lo
-- Remova o # do fastcgi_pass 127.0.0.1:9000;           - Para habilita-lo
----------------------------------------------------------------------------------

systemctl reload nginx.service

apt-get -y install phpmyadmin
----------------------------------------------------------------------------------
-- APERTE 'TAB' E ENTER
-- SE APARECER OUTRA JANELA, MARQUE YES E ENTER
----------------------------------------------------------------------------------

ln -s /usr/share/phpmyadmin/ /usr/share/nginx/html

systemctl reload nginx.service

----------------------------------------------------------------------------------
-- ACESSE SEU PHPMYADMIN
-- CASO NÃO CONSIGA, USE OS COMANDOS ABAIXO NO TERMINAL
----------------------------------------------------------------------------------
mysql -u root

use mysql;

update user set plugin=' ' where User='root';

flush privileges;

exit;
----------------------------------------------------------------------------------
-- ACESSE SEU PHPMYADMIN
-- CASO NÃO CONSIGA, USE OS COMANDOS ACIMA NO TERMINAL
----------------------------------------------------------------------------------

apt-get -y install unzip


mkdir /servidor

cd /servidor

unzip servidor.zip
-- CONFIGURE TEU SERVIDOR




-- VAI ATÉ /usr/share/nginx/html/
-- CONFIGURE TEU WEBSITE

--Adicionando as configurações no AJAX
> Vá até a pasta account e procure por:

ajax_accountname.php
ajax_charactername.php
ajax_email.php

Modifique a seguinte linha:
$conn = mysql_pconnect('localhost', 'root', 'senha') or die();





-- COMPILAR
apt-get update

apt-get install git subversion autoconf build-essential pkg-config libboost-dev libgmp3-dev libxml2-dev liblua5.1-0-dev libmysqlclient-dev ccache libboost-filesystem-dev libboost-regex-dev libboost-system-dev libboost-thread-dev screen libssl-dev libboost-iostreams-dev

apt install automake

cd /servidor/sources

sh ./autogen.sh && ./configure --enable-server-diag --enable-mysql --enable-root-permission && make -j $(nproc)

mv theotxserver /servidor

cd /servidor





---------------------------
-- CONFIGURANDO RESTART.SH
---------------------------

mkdir /servidor/database_backup

nano /servidor/restart.sh


-- Adicionar no documento
/*

while true; do mysqldump YOUR_DATABASE_NAME | bzip2 -c > database_backup/backup$(date +%d-%m-%Y).sql.bz2 && ./theotxserver; done

*/


nano ~/.my.cnf


-- Adicionar no documento
/*

[mysqldump]
user=MYSQL_USER
password=MYSQL_PASS

*/


cd /servidor

chmod 755 restart.sh


-----------------------------

14 // Abrindo seu servidor...

-- Vá até o local do servidor   --  cd /servidor
-- Utilize sempre
screen ./restart.sh


-- Para visualizar o servidor, utilize:
screen -x


-- Para fazer atualização nas sources ou etc... entre no servidor, der /save e feche com CTRL + C no servidor
-- para que ele não consiga abrir o serv novamente

-- Caso precise fechar todos os THEOTXSERVER use o comando
killall -9 theotxserver