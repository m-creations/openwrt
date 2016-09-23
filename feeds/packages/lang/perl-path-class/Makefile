#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-path-class
PKG_VERSION:=0.35
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/K/KW/KWILLIAMS
PKG_SOURCE:=Path-Class-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=575b60a5c5e22e259c1df62a59fdfe85

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Path-Class-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-path-class
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Cross-platform path specification manipulation
  URL:=http://search.cpan.org/dist/Path-Class/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-path-class/install
	$(call perlmod/Install,$(1),Path auto/Path)
endef


$(eval $(call BuildPackage,perl-path-class))
