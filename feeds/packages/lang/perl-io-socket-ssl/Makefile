#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-io-socket-ssl
PKG_VERSION:=2.024
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.cpan.org/authors/id/S/SU/SULLR
PKG_SOURCE:=IO-Socket-SSL-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=9d1be9159475fe67afa5f2e238808086

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/IO-Socket-SSL-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-io-socket-ssl
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=SSL sockets with IO::Socket interface
  URL:=http://search.cpan.org/dist/IO-Socket-SSL/
  DEPENDS:=perl +perlbase-encode +perlbase-essential
endef

define Build/Configure
        $(call perlmod/Configure,,)
endef

define Build/Compile
        $(call perlmod/Compile,,)
endef

define Package/perl-io-socket-ssl/install
        $(call perlmod/Install,$(1),IO auto/IO)
endef


$(eval $(call BuildPackage,perl-io-socket-ssl))
