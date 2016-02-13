#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-text-soundex
PKG_VERSION:=3.05
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/R/RJ/RJBS
PKG_SOURCE:=Text-Soundex-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=cb40ded7a5d27aa3a411d274d6ec18ae

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Text-Soundex-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-text-soundex
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Implementation of the soundex algorithm.
  URL:=http://search.cpan.org/dist/Text-Soundex/
  DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-text-soundex/install
	$(call perlmod/Install,$(1),Text auto/Text)
endef


$(eval $(call BuildPackage,perl-text-soundex))
