#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-file-copy-recursive
PKG_VERSION:=0.38
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/D/DM/DMUEY
PKG_SOURCE:=File-Copy-Recursive-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=e76dc75ab456510d67c6c3a95183f72f

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/File-Copy-Recursive-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-file-copy-recursive
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Perl extension for recursively copying files and directories
  URL:=http://search.cpan.org/dist/File-Copy-Recursive/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-file-copy-recursive/install
	$(call perlmod/Install,$(1),File auto/File)
endef


$(eval $(call BuildPackage,perl-file-copy-recursive))
