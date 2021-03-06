#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=icu
PKG_VERSION:=54.1
PKG_RELEASE:=1

PKG_SOURCE:=icu4c-54_1-src.tgz
PKG_SOURCE_URL:=http://download.icu-project.org/files/icu4c/$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/icu
PKG_FIXUP:=libtool,no-autoreconf
PKG_INSTALL=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/libicu
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ICU library for software internationalization
  URL:=http://icu-project.org
  DEPENDS:=+glib2 +libstdcpp
endef

define Package/libicu/description
	ICU is the premier library for software internationalization. ICU 4.2 is a major reference release of ICU, with
	new features, new APIs, and many bug fixes in data and code.
endef

MAKE_PATH:=source

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/icu

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR)/source all install
endef

define Build/Prepare
	mkdir -p $(HOST_BUILD_DIR)
	$(call Host/Prepare/Default)
	$(call Host/Configure/Default,,,source)
	$(call Host/Compile)
	$(call Build/Prepare/Default)
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-cross-build=$(HOST_BUILD_DIR)/source,, \
		source \
	)
endef

define Package/libicu/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libicu* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libicu))
