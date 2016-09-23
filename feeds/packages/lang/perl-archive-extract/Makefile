#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-archive-extract
PKG_VERSION:=0.76
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/B/BI/BINGOS
PKG_SOURCE:=Archive-Extract-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=110a6000ce4b23da34dcbe890e069f13

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Archive-Extract-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-archive-extract
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A generic archive extracting mechanism
  URL:=http://search.cpan.org/dist/Archive-Extract/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-archive-extract/install
	$(call perlmod/Install,$(1),Archive auto/Archive)
endef


$(eval $(call BuildPackage,perl-archive-extract))
