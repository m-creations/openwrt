#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-xsloader
PKG_VERSION:=0.16
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/S/SA/SAPER
PKG_SOURCE:=XSLoader-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=eadde97008deb281fd6f1d5d595fb2fa

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/XSLoader-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-xsloader
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Dynamically load C libraries into Perl code
  URL:=http://search.cpan.org/dist/XSLoader/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-xsloader/install
	$(call perlmod/Install,$(1), auto/)
endef
$(eval $(call BuildPackage,perl-xsloader))
