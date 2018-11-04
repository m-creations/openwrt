#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=4.5.0
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=node-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nodejs.org/dist/v${PKG_VERSION}
PKG_MD5SUM:=1885586b4b8a2263f77dce27855661e9

PKG_BUILD_DEPENDS:=nodejs/host

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/node-v$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/node-v$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/nodejs
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node.js Evented I/O for V8 JavaScript
  URL:=http://nodejs.org
  MAINTAINER:=Xin Ouyang <xinpascal@gmail.com>
  DEPENDS:=@(TARGET_x86||TARGET_x86_64||TARGET_armeb||TARGET_arm) +libstdcpp +libpthread +librt +libopenssl
endef

define Package/nodejs/description
 Node.js is a platform built on Chrome's JavaScript runtime for easily
 building fast, scalable network applications. Node.js uses an event-driven,
 non-blocking I/O model that makes it lightweight and efficient, perfect
 for data-intensive real-time applications that run across distributed
 devices.
endef

define Package/nodejs-npm
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node Package Manager
  URL:=https://npmjs.org
  MAINTAINER:=Xin Ouyang <xinpascal@gmail.com>
  DEPENDS:=@(TARGET_x86||TARGET_x86_64||TARGET_armeb||TARGET_arm) +libstdcpp +libpthread +librt +libopenssl
endef

define Package/nodejs-npm/description
  npm is the package manager for the Node JavaScript platform. It puts
  modules in place so that node can find them, and manages dependency
  conflicts intelligently.
endef

HOST_CONFIGURE_CMD = $(HOST_CONFIGURE_VARS) ./configure
HOST_CONFIGURE_ARGS = \
	--prefix=$(STAGING_DIR_HOST) \
	--without-snapshot

CONFIGURE_ARGS = \
	--prefix=$(CONFIGURE_PREFIX) \
	--without-snapshot

MAKE_FLAGS += \
	BUILDTYPE=Release

define Package/nodejs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/node $(1)/usr/bin/node
endef

define Package/nodejs-npm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/npm $(1)/usr/bin/npm
	$(INSTALL_DIR) $(1)/usr/lib/node_modules
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/node_modules/npm/ \
		$(1)/usr/lib/node_modules
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/nodejs-src
	$(CP) $(PKG_BUILD_DIR)/* $(1)/usr/share/nodejs-src
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,nodejs))
$(eval $(call BuildPackage,nodejs-npm))
