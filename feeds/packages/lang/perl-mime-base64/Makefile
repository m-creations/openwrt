#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-mime-base64
PKG_VERSION:=3.15
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/G/GA/GAAS
PKG_SOURCE:=MIME-Base64-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=ef958dc2bf96be5f759391c6ac1debd4

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/MIME-Base64-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-mime-base64
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Encoding and decoding of base64 strings
  URL:=http://search.cpan.org/dist/MIME-Base64/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-mime-base64/install
	$(call perlmod/Install,$(1),MIME auto/MIME)
endef


$(eval $(call BuildPackage,perl-mime-base64))
