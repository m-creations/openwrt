#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libfixposix
PKG_VERSION:=0.3.1
PKG_RELEASE:=1

PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=BSL (Boost Software License 1.0)
PKG_LICENSE_FILES:=LICENCE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/sionescu/libfixposix.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=4063906a4da6588f0fb2f01616ad491700e8d2d6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libfixposix
  TITLE:=Replacement library for inconsistent POSIX functions
  URL:=https://github.com/sionescu/libfixposix
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
  # DEPENDS:=+libplist +libpthread +libxml2 +zlib
endef

define Package/libfixposix/description
  The purpose of libfixposix is to offer replacements for parts of POSIX
  whose behaviour is inconsistent across *NIX flavours.
endef

TARGET_CFLAGS += -std=gnu99

# define Build/InstallDev
# 	$(INSTALL_DIR) $(1)/usr/include
# 	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
# 	$(INSTALL_DIR) $(1)/usr/lib
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libusbmuxd.so* $(1)/usr/lib/
# 	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libusbmuxd.pc $(1)/usr/lib/pkgconfig/
# endef

define Package/libfixposix/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfixposix.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libfixposix))
