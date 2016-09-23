#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-xml-twig
PKG_VERSION:=3.49
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/M/MI/MIROD
PKG_SOURCE:=XML-Twig-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=afb5786e15cfe7823add6756382e7df7

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/XML-Twig-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-xml-twig
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A perl module for processing huge XML documents in tree mode.
  URL:=http://search.cpan.org/dist/XML-Twig/
  DEPENDS:=perl +perlbase-essential +perl-xml-parser
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-xml-twig/install
	$(call perlmod/Install,$(1),XML auto/XML)
endef


$(eval $(call BuildPackage,perl-xml-twig))
