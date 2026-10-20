Libs:
	apt-get install subversion autoconf build-essential pkg-config libboost-dev libgmp3-dev libxml2-dev liblua5.1-0-dev libmysqlclient-dev ccache libboost-filesystem-dev libboost-regex-dev libboost-system-dev libboost-thread-dev screen libssl-dev
	
	
Compile:
	sh ./autogen.sh && ./configure --enable-server-diag --enable-mysql --enable-groundcache --enable-root-permission && make -j 2