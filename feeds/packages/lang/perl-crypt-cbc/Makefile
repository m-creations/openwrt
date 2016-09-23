#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-crypt-cbc
PKG_VERSION:=2.33
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/L/LD/LDS
PKG_SOURCE:=Crypt-CBC-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=3db5117d60df67e3b400fe367e716be0

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Crypt-CBC-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-crypt-cbc
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Encrypt Data with Cipher Block Chaining Mode
  URL:=http://search.cpan.org/dist/Crypt-CBC/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-crypt-cbc/install
	$(call perlmod/Install,$(1),Crypt auto/Crypt)
endef


$(eval $(call BuildPackage,perl-crypt-cbc))
