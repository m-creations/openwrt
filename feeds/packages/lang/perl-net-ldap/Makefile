#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-net-ldap
PKG_VERSION:=0.65
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/M/MA/MARSCHAP
PKG_SOURCE:=perl-ldap-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=d057c8db76913d95c0e460c7bdd98b27

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/perl-ldap-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-net-ldap
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=LDAP client
  URL:=http://search.cpan.org/dist/perl-ldap/
  DEPENDS:=perl +perlbase-essential +perlbase-socket +perlbase-symbol +perl-convert-asn1 +perl-text-soundex +perl-io-socket-ssl
endef

define Build/Configure
	$(call perlmod/Configure,,PERL_AUTOINSTALL="--skipdeps")
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-net-ldap/install
	$(call perlmod/Install,$(1),Net auto/Net)
endef


$(eval $(call BuildPackage,perl-net-ldap))
