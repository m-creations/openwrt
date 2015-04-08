#
# Copyright (C) 2006-2015 OpenWrt.org
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
  DEPENDS:=$(CXX_DEPENDS) +zlib +xz
  TITLE:=MariaDB client library
  URL:=http://mariadb.com/
endef

define Package/mariadb-server
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libmariadbclient +libpthread +libncursesw +libreadline
  TITLE:=MariaDB Server
  URL:=http://mariadb.com/
  SUBMENU:=database
endef

define Package/libmariadbclient
  $(call Package/libmariadbclient/Default)
endef

define Package/libmariadbclient-r
  $(call Package/libmariadbclient/Default)
  TITLE += threadsafe
  DEPENDS+= +libpthread
endef

TARGET_CXX=g++-uc

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--enable-thread-safe-client \
	--disable-assembler \
	--with-pthread \
	--with-server \
	--without-mariadbmanager \
	--with-mariadbd-user=root \
	--with-unix-socket-path=/tmp \
	--without-libwrap \
	--with-low-memory \
	--without-embedded-server \
	--without-query-cache \
	--without-ssl \
	--without-docs \
	--without-man \
	--without-readline \
	--without-debug \
	--with-named-thread-libs=-lpthread

CONFIGURE_VARS += \
	mariadb_cv_compress=yes \
	mariadb_cv_gethostname_style=glibc2 \
	mariadb_cv_gcc_atomic_builtins=yes \
	mariadb_cv_gcc_atomic_builtins_pthread_t=yes \
	ac_cv_c_stack_direction=-1

define Build/Configure
	cmake -DPLUGIN_TOKUDB=OFF $(PKG_BUILD_DIR)/CMakeLists.txt
endef

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
	g++ -I $(PKG_BUILD_DIR)/include \
		-o $(PKG_BUILD_DIR)/sql/gen_lex_hash \
		$(PKG_BUILD_DIR)/sql/gen_lex_hash.cc
	+$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)/libmariadb" \
		CC="g++" \
		CFLAGS="$(HOST_CFLAGS)" \
		CPPFLAGS="$(HOST_CFLAGS)" \
		LDFLAGS="$(HOST_LDFLAGS)" \
		conf_to_src
	+$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="libmariadb" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="libmariadb" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
	+$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="libmariadb_r" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="libmariadb_r" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="scripts" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		bin_SCRIPTS="mariadb_config" \
		install
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
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb/libmariadbclient.so.* $(1)/usr/lib/
endef
define Package/libmariadbclient-r/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb/libmariadbclient_r.so.* $(1)/usr/lib/
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
endef

$(eval $(call BuildPackage,mariadb-server))
$(eval $(call BuildPackage,libmariadbclient))
$(eval $(call BuildPackage,libmariadbclient-r))
