#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=graphviz
PKG_VERSION:=2.38.0
PKG_RELEASE:=1

PKG_SOURCE:=graphviz-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.graphviz.org/pub/graphviz/stable/SOURCES
PKG_MD5SUM:=5b6a829b2ac94efcd5fa3c223ed6d3ae
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>
PKG_LICENSE:=Eclipse Public License

# PKG_FIXUP:=autoreconf

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/graphviz-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/graphviz
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+zlib +libltdl +libexpat
  TITLE:=The Graphviz graphics library
  URL:=http://graphviz.org/
endef

define Package/graphviz/description
  Graphviz is open source graph visualization software.
  Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks.
endef

# TARGET_CFLAGS += $(FPIC)

# CONFIGURE_ARGS += \
# 	--enable-shared \
# 	--enable-static \
# 	--disable-rpath \
# 	--without-x \
# 	--without-fontconfig \
# 	--without-freetype \
# 	--with-jpeg=$(STAGING_DIR)/usr \
# 	--with-png=$(STAGING_DIR)/usr \
# 	--with-vpx=no \
# 	--without-xpm \
# 	--without-iconv

# CONFIGURE_VARS += \
# 	LIBPNG12_CONFIG="$(STAGING_DIR)/host/bin/libpng12-config" \
# 	ac_cv_header_iconv_h=no

# define Build/InstallDev
# 	$(INSTALL_DIR) $(1)/usr/bin
# 	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gdlib-config $(1)/usr/bin/
# 	$(SED) \
# 		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
# 		$(1)/usr/bin/gdlib-config
# 	$(INSTALL_DIR) $(1)/usr/include
# 	$(CP) $(PKG_INSTALL_DIR)/usr/include/entities.h $(1)/usr/include/
# 	$(CP) $(PKG_INSTALL_DIR)/usr/include/gd{,_io,cache,fontg,fontl,fontmb,fonts,fontt,fx}.h \
# 		$(1)/usr/include/
# 	$(INSTALL_DIR) $(1)/usr/lib
# 	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgd.{a,la,so*} $(1)/usr/lib/
# 	$(INSTALL_DIR) $(2)/bin
# 	$(LN) ../../usr/bin/gdlib-config $(2)/bin/
# endef

define Package/graphviz/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dot $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/graphviz/* $(1)/usr/lib/graphviz/
endef

$(eval $(call BuildPackage,graphviz))
