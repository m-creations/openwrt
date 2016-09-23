#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xtrabackup
PKG_VERSION:=2.2.12
PKG_RELEASE:=1

PKG_SOURCE:=percona-xtrabackup-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-$(PKG_VERSION)/source/tarball
PKG_BUILD_DIR:=$(BUILD_DIR)/percona-$(PKG_NAME)-$(PKG_VERSION)

PKG_MD5SUM:=ba04fa262fdb842fba1bd58b62cf293e
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=GPL-2.0

# PKG_BUILD_DEPENDS += mariadb/host libncurses libreadline
# HOST_BUILD_DEPENDS += mariadb/host

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/xtrabackup
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+mariadb-galera-server
  TITLE:=Percona XtraBackup hot backup utility for MariaDB
  URL:=http://percona.com/software/percona-xtrabackup
  SUBMENU:=database
endef

CMAKE_OPTIONS += -C "$(PKG_BUILD_DIR)"/CMakeCache-$(ARCH).txt

define Package/xtrabackup/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysqlcheck $(1)/usr/bin/
endef

$(eval $(call BuildPackage,xtrabackup))
