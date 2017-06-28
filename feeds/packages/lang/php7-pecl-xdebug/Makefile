#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=xdebug
PECL_LONGNAME:=Xdebug debugging extension

PKG_VERSION:=2.4.1
PKG_RELEASE:=1
PKG_MD5SUM:=03f52af10108450942c9c0ac3b72637f

PKG_NAME:=php7-pecl-xdebug
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../php7/pecl.mk

CONFIGURE_ARGS+= \
	--enable-xdebug

define Package/php7-pecl-xdebug/install
	$(INSTALL_DIR) $(1)/etc/php7
	$(INSTALL_DATA) ./files/xdebug.ini $(1)/etc/php7
endef

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),,zend))
$(eval $(call BuildPackage,$(PKG_NAME)))
