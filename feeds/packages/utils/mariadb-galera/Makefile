#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/uclibc++.mk

PKG_NAME:=mariadb-galera
PKG_VERSION:=1.0.16
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.mariadb.org/f/$(PKG_NAME)-$(PKG_VERSION)/source/

PKG_MD5SUM:=c9da022abc6023b06320c31ae26a0f2e
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=GPL-2.0

PKG_BUILD_DEPENDS:=libncurses libreadline
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/mariadb-galera
  SECTION:=utils
  CATEGORY:=Utilities
  # DEPENDS:=+libmariadbclient +libpthread +libncursesw +libreadline
  TITLE:=MariaDB Galera Cluster
  URL:=http://mariadb.com/
  SUBMENU:=database
endef

# TARGET_CXX=g++-uc

# TARGET_CFLAGS += $(FPIC)

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
	cmake -DWITH_WSREP=ON -DWITH_INNODB_DISALLOW_WRITES=1
endef

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
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin $(1)/usr/include $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mariadb_config $(1)/usr/bin/
	ln -sf $(STAGING_DIR)/usr/bin/mariadb_config $(2)/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mariadb $(1)/usr/include/
	# NOTE: needed for Mariadb-Python
	$(CP) $(PKG_BUILD_DIR)/include/mariadbd_error.h $(1)/usr/include/mariadb/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb $(1)/usr/lib/
	rm -f $(1)/usr/lib/mariadb/libmariadbclient.la
endef

define Package/mariadb-galera/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mariadb/libmariadbclient.so.* $(1)/usr/lib/
endef

define Package/mariadb-galera/conffiles
/etc/mariadb-galera.cnf
endef

$(eval $(call BuildPackage,mariadb-galera))
