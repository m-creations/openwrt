#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/uclibc++.mk

PKG_NAME:=mariadb
PKG_VERSION:=10.0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.mariadb.org/interstitial/${PKG_NAME}-${PKG_VERSION}/source/

PKG_MD5SUM:=3101d1e79c1b04699cde10780f959625
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=GPL-2.0

PKG_BUILD_DEPENDS:=libncurses libreadline
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libmariadbclient/Default
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=$(CXX_DEPENDS) +zlib +xz @BROKEN
  TITLE:=MariaDB client library
  URL:=http://mariadb.com/
endef

define Package/mariadb-server
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libmariadbclient +libpthread +libncursesw +libreadline +libevent +xz
  TITLE:=MariaDB Server
  URL:=http://mariadb.com/
  SUBMENU:=database
endef

define Package/libmariadbclient
  $(call Package/libmariadbclient/Default)
  DEPENDS+= +libpthread +libopenssl +libcrypto +libncurses +libevent +libform
endef

define Package/libmariadbclient-r
  $(call Package/libmariadbclient/Default)
  TITLE += threadsafe
  DEPENDS+= +libpthread +libopenssl +libncurses +libevent +libform
endef

CMAKE_OPTIONS += \
	-DCMAKE_BUILD_TYPE:String="MinSizeRel" \
	-DCMAKE_PREFIX_PATH=$(STAGING_DIR)/usr \
	-DWITH_PARTITION_STORAGE_ENGINE:BOOL=ON \
	-DWITH_UNIT_TESTS:BOOL=OFF \
	-DSTACK_DIRECTION=-1 \
	-DWITH_JEMALLOC:STRING=system \
	-DCURSES_USE_NCURSES=TRUE \
	-DCURSES_LIBRARY="$(STAGING_DIR)/usr/lib/libncursesw.so" \
	-DCURSES_INCLUDE_PATH="$(STAGING_DIR)/usr/include"

# CMAKE_OPTIONS += -DSTACK_DIRECTION=-1 -DXTRADB_OK=1 -DWITHOUT_XTRADB=1 -DHAVE_BACKTRACE_WITHOUT_EXECINFO=1 -DWITH_UNIT_TESTS=0 -DHAVE_CXX_-Wmissing-prototypes=0 -DHAVE_CXX_-Wstrict-prototypes=1 -DHAVE_STDCXX11=1 -DHAVE_STDCXX0X=1 -DHAVE_CXX_-Wcast-align=1 -DHAVE_CXX_-Wshadow=1 -DHAVE_CXX_-Wpointer-arith=1 -DHAVE_CXX_-Wmissing-declarations=1 -DHAVE_CXX_-Wbad-function-cast=1 -DHAVE_CXX_-Wno-missing-noreturn=0 -DHAVE_C_-fno-rtti=1 -DHAVE_C_-Wcast-align=1 -DHAVE_C_-Wshadow=1 -DHAVE_C_-Wpointer-arith=1 -DHAVE_C_-Wmissing-declarations=1 -DHAVE_C_-Wmissing-prototypes=1 -DHAVE_C_-Wstrict-prototypes=1 -DHAVE_C_-Wno-missing-noreturn=0 -DHAVE_C_-Wbad-function-cast=1 -DHAVE_C_-Wextra=1 -DHAVE_C_-Wno-error=strict-overflow

# CONFIGURE_ARGS += \
# 	--enable-shared \
# 	--enable-static \
# 	--enable-thread-safe-client \
# 	--disable-assembler \
# 	--with-pthread \
# 	--with-server \
# 	--without-mariadbmanager \
# 	--with-mariadbd-user=root \
# 	--with-unix-socket-path=/tmp \
# 	--without-libwrap \
# 	--with-low-memory \
# 	--without-embedded-server \
# 	--without-query-cache \
# 	--without-ssl \
# 	--without-docs \
# 	--without-man \
# 	--without-readline \
# 	--without-debug \
# 	--with-named-thread-libs=-lpthread

# CONFIGURE_VARS += \
# 	mariadb_cv_compress=yes \
# 	mariadb_cv_gethostname_style=glibc2 \
# 	mariadb_cv_gcc_atomic_builtins=yes \
# 	mariadb_cv_gcc_atomic_builtins_pthread_t=yes \
# 	ac_cv_c_stack_direction=-1

define Build/Configure
       cd $(PKG_BUILD_DIR) && ./BUILD/compile-pentium64
endef

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef


define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin $(1)/usr/include $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mariadb_config $(1)/usr/bin/
	ln -sf $(STAGING_DIR)/usr/bin/mariadb_config $(2)/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mariadb $(1)/usr/include/
	# NOTE: needed for Mariadb-Python
	$(CP) $(PKG_BUILD_DIR)/include/mariadbd_error.h $(1)/usr/include/mariadb/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb $(1)/usr/lib/
	rm -f $(1)/usr/lib/mariadb/libmariadbclient.la
endef

define Package/libmariadbclient/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/mysql/lib/libmysqlclient.so.* $(1)/usr/lib/
endef
define Package/libmariadbclient-r/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/mysql/lib/libmysqlclient_r.so.* $(1)/usr/lib/
endef

define Package/mariadb-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mariadb $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/mariadbd $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/myisamchk $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mariadbadmin $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mariadbdump $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mariadb_install_db $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/my_print_defaults $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/mariadbd.init $(1)/etc/init.d/mariadbd
	$(INSTALL_CONF) conf/my.cnf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/share/mariadb
	$(INSTALL_DIR) $(1)/usr/share/mariadb/english
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mariadb/english/errmsg.sys $(1)/usr/share/mariadb/english
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mariadb/fill_help_tables.sql $(1)/usr/share/mariadb/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mariadb/mariadb_system_tables.sql $(1)/usr/share/mariadb/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mariadb/mariadb_system_tables_data.sql $(1)/usr/share/mariadb/
endef

define Package/mariadb-server/conffiles
/etc/my.cnf
/usr/lib/libmysqlclient.so.18
endef

$(eval $(call BuildPackage,mariadb-server))
$(eval $(call BuildPackage,libmariadbclient))
$(eval $(call BuildPackage,libmariadbclient-r))


# --------------------------------------------------------------------------------------

# include $(INCLUDE_DIR)/package.mk
# include $(INCLUDE_DIR)/cmake.mk

# define Package/libmariadbclient/Default
#   SECTION:=libs
#   CATEGORY:=Libraries
#   DEPENDS:=$(CXX_DEPENDS) +zlib @BROKEN
#   TITLE:=MariaDB client library
#   URL:=http://mariadb.org
# endef

# define Package/mariadb-server
#   SECTION:=utils
#   CATEGORY:=Utilities
#   DEPENDS:=+libmariadbclient +libpthread +libncursesw +libreadline +jemalloc @BROKEN
#   TITLE:=MariaDB Server
#   URL:=http://mariadb.org
#   SUBMENU:=Database
# endef

# define Package/libmariadbclient
#   $(call Package/libmariadbclient/Default)
# endef

# define Package/libmariadbclient-r
#   $(call Package/libmariadbclient/Default)
#   TITLE += threadsafe
#   DEPENDS+= +libpthread @BROKEN
# endef


# CMAKE_OPTIONS += \
# 	-DCMAKE_BUILD_TYPE:String="MinSizeRel" \
# 	-DCMAKE_PREFIX_PATH=$(STAGING_DIR)/usr \
# 	-DWITH_PARTITION_STORAGE_ENGINE:BOOL=ON \
# 	-DWITH_UNIT_TESTS:BOOL=OFF \
# 	-DSTACK_DIRECTION=-1 \
# 	-DWITH_JEMALLOC:STRING=system \
# 	-DCURSES_USE_NCURSES=TRUE \
# 	-DCURSES_LIBRARY="$(STAGING_DIR)/usr/lib/libncursesw.so" \
# 	-DCURSES_INCLUDE_PATH="$(STAGING_DIR)/usr/include"


# define Build/InstallDev
# 	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin $(1)/usr/include $(1)/usr/lib
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysql_config $(1)/usr/bin/
# 	ln -sf $(STAGING_DIR)/usr/bin/mysql_config $(2)/bin/
# 	$(CP) $(PKG_INSTALL_DIR)/usr/include/mysql $(1)/usr/include/
# 	# NOTE: needed for MySQL-Python
# 	$(CP) $(PKG_BUILD_DIR)/include/mysqld_error.h $(1)/usr/include/mysql/
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mysql $(1)/usr/lib/
# 	rm -f $(1)/usr/lib/mysql/libmysqlclient.la
# endef

# define Package/libmariadbclient/install
# 	$(INSTALL_DIR) $(1)/usr/lib
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb/libmariadbclient.so.* $(1)/usr/lib/
# endef
# define Package/libmariadbclient-r/install
# 	$(INSTALL_DIR) $(1)/usr/lib
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb/libmariadbclient_r.so.* $(1)/usr/lib/
# endef

# define Package/mariadb-server/install
# 	$(INSTALL_DIR) $(1)/usr/bin
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysqlb $(1)/usr/bin/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/mysqld $(1)/usr/bin/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/myisamchk $(1)/usr/bin/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysqladmin $(1)/usr/bin/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysqldump $(1)/usr/bin/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysql_install_db $(1)/usr/bin/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/my_print_defaults $(1)/usr/bin/
# 	$(INSTALL_DIR) $(1)/etc/init.d/
# 	$(INSTALL_BIN) files/mysql.init $(1)/etc/init.d/mysqld
# 	$(INSTALL_CONF) conf/my.cnf $(1)/etc/
# 	$(INSTALL_DIR) $(1)/usr/share/mysql
# 	$(INSTALL_DIR) $(1)/usr/share/mysql/english
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mysql/english/errmsg.sys $(1)/usr/share/mysql/english
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mysql/fill_help_tables.sql $(1)/usr/share/mysql/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mysql/mariadb_system_tables.sql $(1)/usr/share/mysql/
# 	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/mysql/mariadb_system_tables_data.sql $(1)/usr/share/mysql/
# endef

# define Package/mariadb-server/conffiles
# /etc/my.cnf
# endef

# $(eval $(call BuildPackage,mariadb-server))
# $(eval $(call BuildPackage,libmariadbclient))
# $(eval $(call BuildPackage,libmariadbclient-r))

# diff --git a/libs/mariadb/conf/my.cnf b/libs/mariadb/conf/my.cnf
# new file mode 100644
# index 0000000..ec2ade2
# --- /dev/null
# -++ b/libs/mariadb/conf/my.cnf
# @@ -0,0 +1,54 @@
# [client]
# port		= 3306
# socket		= /var/run/mysqld.sock

# [mysqld]
# user		= root
# socket		= /var/run/mysqld.sock
# port		= 3306
# basedir		= /usr

# ############ Don't put this on the NAND #############
# # Figure out where you are going to put the databases
# # And run mysql_install_db --force
# datadir		= /mnt/data/mysql/

# ######### This should also not go on the NAND #######
# tmpdir		= /mnt/data/tmp/

# skip-external-locking

# bind-address		= 127.0.0.1

# # Fine Tuning
# key_buffer		= 16M
# max_allowed_packet	= 16M
# thread_stack		= 192K
# thread_cache_size       = 8

# # Here you can see queries with especially long duration
# #log_slow_queries	= /var/log/mysql/mysql-slow.log
# #long_query_time = 2
# #log-queries-not-using-indexes

# # The following can be used as easy to replay backup logs or for replication.
# #server-id		= 1
# #log_bin			= /var/log/mysql/mysql-bin.log
# #expire_logs_days	= 10
# #max_binlog_size         = 100M
# #binlog_do_db		= include_database_name
# #binlog_ignore_db	= include_database_name


# [mysqldump]
# quick
# quote-names
# max_allowed_packet	= 16M

# [mysql]
# #no-auto-rehash	# faster start of mysql but no tab completition

# [isamchk]
# key_buffer		= 16M

