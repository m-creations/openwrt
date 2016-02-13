#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-convert-asn1
PKG_VERSION:=0.27
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/G/GB/GBARR
PKG_SOURCE:=Convert-ASN1-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=68723e96be0b258a9e20480276e8a62c

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Convert-ASN1-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-convert-asn1
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=LDAP client
  URL:=http://search.cpan.org/dist/perl-ldap/
  DEPENDS:=perl +perlbase-essential +perlbase-socket
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-convert-asn1/install
	$(call perlmod/Install,$(1),Convert auto/Convert)
endef


$(eval $(call BuildPackage,perl-convert-asn1))
