#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rlwrap
PKG_VERSION:=0.43
PKG_RELEASE:=1

PKG_MD5SUM:=b993e83d3a292464de70719b32f83a34

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/hanslub42/rlwrap/releases/download/v$(PKG_VERSION)
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/rlwrap
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Allows editing of command line input for any application
  DEPENDS:=+libncurses libreadline
  URL:=http://www.gnu.org/software/grep/
endef

define Package/rlwrap/description
Wrapper around the GNU readline library to allow
the editing of keyboard input for any command.
endef

define Package/rlwrap/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rlwrap $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/rlwrap
	$(CP) $(PKG_INSTALL_DIR)/usr/share/rlwrap/* $(1)/usr/share/rlwrap
endef

# define Package/grep/postinst
# #!/bin/sh
# [ -L "$${IPKG_INSTROOT}/bin/grep" ] && rm -f "$${IPKG_INSTROOT}/bin/grep"
# exit 0
# endef

# define Package/grep/prerm
# $${IPKG_INSTROOT}/bin/busybox grep -h 2>&1 | grep -q BusyBox && \
# ln -sf busybox $${IPKG_INSTROOT}/bin/grep
# exit 0
# endef

$(eval $(call BuildPackage,rlwrap))
