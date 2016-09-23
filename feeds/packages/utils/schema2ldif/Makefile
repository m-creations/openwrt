#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=schema2ldif
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://repos.fusiondirectory.org/sources/1.0/schema2ldif
PKG_SOURCE:=schema2ldif-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=2f06b974a0b6d3982027cb0ae502694f

PKG_LICENSE:=BSD
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/schema2ldif
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Tool for converting OpenLDAP-style schemas to the LDIF format
  URL:=http://repos.fusiondirectory.org/sources/1.0/schema2ldif
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/schema2ldif/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/schema2ldif $(1)/usr/bin/
endef

$(eval $(call BuildPackage,schema2ldif))
