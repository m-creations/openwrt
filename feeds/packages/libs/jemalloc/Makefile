#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jemalloc
PKG_VERSION:=3.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.canonware.com/download/jemalloc
PKG_MD5SUM:=43a6ce2f60d14d58c4b28b73b8b70cd2

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/jemalloc
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=malloc alternative
  DEPENDS:=+libpthread
  URL:=http://www.canonware.com/jemalloc/index.html
endef

define Package/jemalloc/description
jemalloc is a general purpose malloc(3) implementation that emphasizes fragmentation avoidance and scalable concurrency support.
endef

CONFIGURE_ARGS += \
	--host=$(REAL_GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--disable-experimental \
	je_cv_static_page_shift=12

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/jemalloc
	$(CP) $(PKG_INSTALL_DIR)/usr/include/jemalloc/jemalloc.h $(1)/usr/include/jemalloc
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjemalloc*.{a,so*} $(1)/usr/lib/
endef

define Package/jemalloc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjemalloc.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjemalloc*.a $(1)/usr/lib/
endef

$(eval $(call BuildPackage,jemalloc))
