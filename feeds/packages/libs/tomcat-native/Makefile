#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tomcat-native
PKG_VERSION:=1.2.4
PKG_RELEASE:=1

PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=Apache License
PKG_LICENSE_FILES:=LICENCE

PKG_SOURCE_URL:=http://mirrors.ibiblio.org/apache/tomcat/tomcat-connectors/native/$(PKG_VERSION)/source
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/tomcat-native-$(PKG_VERSION)-src
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_MD5SUM:=e1886b02127bce487f355f11a9566e03

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tomcat-native
  TITLE:=Native library for Apache Tomcat
  URL:=http://tomcat.apache.org/native-doc
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Tomcat native library
  DEPENDS:=+libapr +libopenssl
endef

define Package/tomcat-native/description
  The Apache Tomcat Native Library is an optional component for use with
  Apache Tomcat that allows Tomcat to use certain native resources for
  performance, compatibility, etc.
endef


CONFIGURE_ARGS+= \
	--with-apr="$(STAGING_DIR)/usr/bin/apr-1-config" \
	--with-ssl \
	--prefix=/usr

# TARGET_CFLAGS += -std=gnu99

# define Build/InstallDev
# 	$(INSTALL_DIR) $(1)/usr/include
# 	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
# 	$(INSTALL_DIR) $(1)/usr/lib
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libusbmuxd.so* $(1)/usr/lib/
# 	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libusbmuxd.pc $(1)/usr/lib/pkgconfig/
# endef

define Package/tomcat-native/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,tomcat-native))
