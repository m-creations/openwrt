#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mariadb
PKG_VERSION:=10.0.21
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-galera-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.mariadb.org/interstitial/$(PKG_NAME)-galera-$(PKG_VERSION)/source
# PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
# HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MD5SUM:=2dfbc5793bfe025039c0b4dd6e314f5d
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=GPL-2.0

PKG_BUILD_DEPENDS += mariadb/host libncurses libreadline
HOST_BUILD_DEPENDS += mariadb/host

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/libmariadb
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:= +libstdcpp +zlib +libpthread +libncurses +libreadline +libopenssl
  TITLE:=MariaDB client library
  URL:=http://mariadb.org/
endef

define Package/mariadb/Default
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libmariadb
  TITLE:=MariaDB
  URL:=http://mariadb.org/
  SUBMENU:=database
endef

define Package/mariadb-client
  $(call Package/mariadb/Default)
  TITLE+= client applications
endef

define Package/mariadb-client-extra
  $(call Package/mariadb/Default)
  DEPENDS+=+mariadb-client
  TITLE+= additional client applications
endef

define Package/mariadb-server
  $(call Package/mariadb/Default)
  TITLE+= server
  DEPENDS+=+libpam +libpcre
endef

define Package/mariadb-galera
  $(call Package/mariadb/Default)
  TITLE+= Galera cluster
  DEPENDS+=+mariadb-server +rsync
endef


CMAKE_OPTIONS += -DWITH_WSREP=ON -DWITH_INNODB_DISALLOW_WRITES=1
CMAKE_OPTIONS += -DIMPORT_EXECUTABLES=$(HOST_BUILD_DIR)/host/import_executables.cmake
CMAKE_OPTIONS += -C "$(PKG_BUILD_DIR)"/CMakeCache-$(ARCH).txt

# We need some executables which are needed during target build
# so we build them in this host package and access them with
# -DIMPORT_EXECUTABLES during target build (cf. above)
define Host/Compile
	( cd $(HOST_BUILD_DIR)/ ; mkdir host/ ; cd host ; cmake .. ; $(MAKE) import_executables )
endef

# define Host/Install
# 	printf "\n*** Compilation of cross-compilation tools finished successfully\n\n"
# endef

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="include" \
		DESTDIR="$(PKG_INSTALL_DIR)"
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin $(1)/usr/include $(1)/usr/lib $(1)/usr/share/aclocal
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysql_config $(1)/usr/bin/
	ln -sf $(STAGING_DIR)/usr/bin/mysql_config $(2)/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mysql $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/mysql.m4 $(1)/usr/share/aclocal/
endef

define Package/libmariadb/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/lib/mysql
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmysqlclient*.so.* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/mysql_clear_password.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/dialog.so $(1)/usr/lib/mysql/
endef

define Package/mariadb-client/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlcheck $(1)/usr/bin/
endef

define Package/mariadb-client-extra/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/innochecksum $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlaccess $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqladmin $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlbug $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqldump $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqldumpslow $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_find_rows $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_fix_extensions $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlimport $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlshow $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlslap $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_waitpid $(1)/usr/bin/
endef

define Package/mariadb-server/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/mysql $(1)/usr/lib/mysql $(1)/etc/mysql $(1)/etc/mysql/conf.d $(1)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqld $(1)/usr/bin/mysqld
	$(INSTALL_BIN) files/mariadb.init $(1)/etc/init.d/mariadb
	# these two need perl and should go into their own package which depends on perl + dbi + ?
	# $(INSTALL_BIN) files/mysqlreport $(1)/usr/bin/
	# $(INSTALL_BIN) files/innotop $(1)/usr/bin/
	$(INSTALL_CONF) files/my.cnf $(1)/etc/mysql/
	$(INSTALL_CONF) files/conf.d/* $(1)/etc/mysql/conf.d/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/auth_pam.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/auth_socket.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/ha_mroonga.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/ha_sequence.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/ha_sphinx.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/ha_spider.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/ha_innodb.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/handlersocket.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/locales.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/metadata_lock_info.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/query_cache_info.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/query_response_time.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/semisync_master.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/semisync_slave.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/sql_errlog.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/plugin/server_audit.so $(1)/usr/lib/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/msql2mysql $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/my_print_defaults $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/myisamchk $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/myisam_ftdump $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/myisamlog $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/myisampack $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aria_pack $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aria_read_log $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aria_ftdump $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aria_chk $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/aria_dump_log $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_convert_table_format $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/scripts/mysql_install_db $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_plugin $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_secure_installation $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_setpermission $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_tzinfo_to_sql $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_upgrade $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_zap $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlbinlog $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqld_multi $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqld_safe $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlhotcopy $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/perror $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/replace $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/resolve_stack_dump $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/resolveip $(1)/usr/bin/
endef

define Package/mariadb-galera/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/mysql
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wsrep* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/support-files/wsrep* $(1)/usr/share/mysql/
endef

# these two need perl with dbi etc. so postponing them
# $(PKG_BUILD_DIR)/debian/additions/mysqlreport
# $(PKG_BUILD_DIR)/debian/additions/innotop

define Package/mariadb/conffiles
/etc/mysql/my.cnf
/etc/mysql/conf.d
endef

$(eval $(call HostBuild))

$(eval $(call BuildPackage,libmariadb))
$(eval $(call BuildPackage,mariadb-client))
$(eval $(call BuildPackage,mariadb-client-extra))
$(eval $(call BuildPackage,mariadb-server))
$(eval $(call BuildPackage,mariadb-galera))
