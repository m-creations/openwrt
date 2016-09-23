#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-crypt-passwdmd5
PKG_VERSION:=1.40
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/R/RS/RSAVAGE
PKG_SOURCE:=Crypt-PasswdMD5-$(PKG_VERSION).tgz
PKG_MD5SUM:=efc61e1f62c9768be39df2613d685343

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Crypt-PasswdMD5-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-crypt-passwdmd5
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Provide interoperable MD5-based crypt() functions
  URL:=http://search.cpan.org/dist/Crypt-PasswdMD5/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-crypt-passwdmd5/install
	$(call perlmod/Install,$(1),Crypt auto/Crypt)
endef


$(eval $(call BuildPackage,perl-crypt-passwdmd5))
