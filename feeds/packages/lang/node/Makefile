#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v0.12.4
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=node-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nodejs.org/dist/${PKG_VERSION}
PKG_MD5SUM:=c2b4deea212c0b7c2f86368c65fab312

include $(INCLUDE_DIR)/package.mk

define Package/node
  DEPENDS:=+libpthread +librt +libstdcpp +libopenssl +libbz2
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node.js is a platform built on Chrome's JavaScript runtime
  URL:=http://nodejs.org/
endef

define Package/node/description
Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
	export LIBS="$(LIBS)"; \
	export CFLAGS="$(TARGET_CFLAGS) $(LIBS)"; \
	export CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBS)"; \
	./configure --without-snapshot --prefix=/usr ; \
	);
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFLAGS="$(TARGET_CFLAGS) $(LIBS)" CXXFLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)$(CLIMITS_INCLUDE)" LDFLAGS="$(TARGET_LDFLAGS) -nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -lstdc++ -lc -lgcc $(LIBGCC_S) -lpthread"
endef


define Package/node/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/out/Release/node $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/npm $(1)/usr/bin/
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib $(1)/usr/lib
	ln -s /usr/bin/node $(1)/usr/bin/nodejs
endef

$(eval $(call BuildPackage,node))
