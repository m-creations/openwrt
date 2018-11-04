#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fusiondirectory
PKG_VERSION:=1.0.9.2
PKG_RELEASE:=1

PKG_MAINTAINER:=Kambiz Darabi <darabi@m-creations.net>

PKG_LICENSE:=Apache
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/fusiondirectory/fusiondirectory/archive
PKG_MD5SUM:=64d9a82068e3b0bbb16c261261391172

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# PKG_FIXUP:=libtool autoreconf
# PKG_BUILD_PARALLEL:=1
# PKG_USE_MIPS16:=0

# PHP5_MODULES = \
# 	apache \
# 	bz2 \
# 	calendar ctype curl \
# 	fileinfo \
# 	dom \
# 	exif \
# 	ftp \
# 	gettext gd gmp \
# 	hash \
# 	iconv intl \
# 	json \
# 	ldap \
# 	mbstring mcrypt mysql mysqli \
# 	opcache openssl \
# 	pcntl pdo pdo-mysql pdo-pgsql pdo-sqlite pgsql \
# 	session shmop simplexml soap sockets sqlite3 sysvmsg sysvsem sysvshm \
# 	tokenizer \
# 	xml xmlreader xmlrpc xmlwriter zip \

# # needed for apache module
# PKG_BUILD_DEPENDS:=apache

# PKG_CONFIG_DEPENDS:= \
# 	$(patsubst %,CONFIG_PACKAGE_php5-mod-%,$(PHP5_MODULES)) \
# 	CONFIG_PHP5_FILTER CONFIG_PHP5_LIBXML CONFIG_PHP5_SYSTEMTZDATA

include $(INCLUDE_DIR)/package.mk

# include $(INCLUDE_DIR)/nls.mk

define Package/fusiondirectory/Default
  SUBMENU:=FusionDirectory
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=FusionDirectory LDAP management interface 
  URL:=https://www.fusiondirectory.org/
  DEPENDS:=php5
endef

define Package/fusiondirectory/Default/description
  FusionDirectory provides a solution to daily management of data stored in an LDAP directory.
endef

# define Package/php5/config
# 	config PHP5_FILTER
# 		bool "PHP5 Filter support"
# 		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi

# 	config PHP5_LIBXML
# 		bool "PHP5 LIBXML support"
# 		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi

# 	config PHP5_SYSTEMTZDATA
# 		bool "Use system timezone data instead of php's built-in database"
# 		depends on PACKAGE_php5-cli || PACKAGE_php5-cgi
# 		select PACKAGE_zoneinfo-core
# 		default y
# 		help
# 			Enabling this feature automatically selects the zoneinfo-core package
# 			which contains data for UTC timezone. To use other timezones you have
# 			to install the corresponding zoneinfo-... package(s).
# endef

define Package/fusiondirectory
  $(call Package/fusiondirectory/Default)

  DEPENDS:=+php5 +perl-path-class +perl-net-ldap +perl-mime-base64 +perl-crypt-passwdmd5 \
           +perl-crypt-cbc +perl-file-copy-recursive +perl-archive-extract +perl-xml-twig \
           +schema2ldif
endef

# define Package/php5/description
#   $(call Package/php5/Default/description)
#   This package contains only the PHP config file. You must actually choose
#   your PHP flavour (cli, cgi or fastcgi).
# endef

# define Package/php5-cli
#   $(call Package/php5/Default)
#   TITLE+= (CLI)
#   DEPENDS:=+libstdcpp +libpcre +zlib \
#            +PHP5_LIBXML:libxml2
# endef

# define Package/php5-cli/description
#   $(call Package/php5/Default/description)
#   This package contains the CLI version of the PHP5 interpreter.
# endef

define Build/Configure
endef

define Build/Compile
endef

define Package/fusiondirectory/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/php.ini $(1)/etc/
endef


define BuildModule

  define Package/fusiondirectory-$(1)
    $(call Package/fusiondirectory/Default)

    ifneq ($(3),)
      DEPENDS+=$(3)
    endif

    TITLE:=$(2) extension
  endef

  define Package/fusiondirectory-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/fusiondirectory
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$(subst -,_,$(1)).so $$(1)/usr/lib/fusiondirectory/
	$(INSTALL_DIR) $$(1)/etc/fusiondirectory
      ifeq ($(4),schema)
	echo "zend_extension=/usr/lib/php/$(subst -,_,$(1)).so" > $$(1)/etc/php5/$(subst -,_,$(1)).ini
      else
	echo "extension=$(subst -,_,$(1)).so" > $$(1)/etc/php5/$(subst -,_,$(1)).ini
    endif
  endef

  $$(eval $$(call BuildPackage,php5-mod-$(1)))

endef

$(eval $(call BuildPackage,php5))
$(eval $(call BuildPackage,php5-cgi))
$(eval $(call BuildPackage,php5-cli))
$(eval $(call BuildPackage,php5-fastcgi))
$(eval $(call BuildPackage,php5-fpm))

#$(eval $(call BuildModule,NAME,TITLE[,PKG DEPENDS]))
$(eval $(call BuildModule,apache,Apache 2,+PACKAGE_php5-mod-apache:apache))
$(eval $(call BuildModule,bz2,Bzip 2,+PACKAGE_php5-mod-bz2:bzip2 +PACKAGE_php5-mod-bz2:libbz2))
$(eval $(call BuildModule,calendar,Calendar))
$(eval $(call BuildModule,ctype,Ctype))
$(eval $(call BuildModule,curl,cURL,+PACKAGE_php5-mod-curl:libcurl))
$(eval $(call BuildModule,dom,DOM,+@PHP5_LIBXML +PACKAGE_php5-mod-dom:libxml2))
$(eval $(call BuildModule,exif,EXIF))
$(eval $(call BuildModule,fileinfo,Fileinfo))
$(eval $(call BuildModule,ftp,FTP,+PACKAGE_php5-mod-ftp:libopenssl))
$(eval $(call BuildModule,gd,GD graphics,+PACKAGE_php5-mod-gd:libjpeg +PACKAGE_php5-mod-gd:libpng))
$(eval $(call BuildModule,gettext,Gettext,+PACKAGE_php5-mod-gettext:libintl-full))
$(eval $(call BuildModule,gmp,GMP,+PACKAGE_php5-mod-gmp:libgmp))
$(eval $(call BuildModule,hash,Hash))
$(eval $(call BuildModule,iconv,iConv,$(ICONV_DEPENDS)))
$(eval $(call BuildModule,intl,Internationalization,+PACKAGE_php5-mod-intl:libicu))
$(eval $(call BuildModule,json,JSON))
$(eval $(call BuildModule,ldap,LDAP,+PACKAGE_php5-mod-ldap:libopenldap +PACKAGE_php5-mod-ldap:libsasl2))
$(eval $(call BuildModule,mbstring,MBString))
$(eval $(call BuildModule,mcrypt,Mcrypt,+PACKAGE_php5-mod-mcrypt:libmcrypt +PACKAGE_php5-mod-mcrypt:libltdl))
$(eval $(call BuildModule,mysql,MySQL,+PACKAGE_php5-mod-mysql:libmysqlclient))
$(eval $(call BuildModule,mysqli,MySQL Improved Extension,+PACKAGE_php5-mod-mysqli:libmysqlclient))
$(eval $(call BuildModule,opcache,OPcache,,zend))
$(eval $(call BuildModule,openssl,OpenSSL,+PACKAGE_php5-mod-openssl:libopenssl))
$(eval $(call BuildModule,pcntl,PCNTL))
$(eval $(call BuildModule,pdo,PHP Data Objects))
$(eval $(call BuildModule,pdo-mysql,PDO driver for MySQL,+php5-mod-pdo +PACKAGE_php5-mod-pdo-mysql:libmysqlclient))
$(eval $(call BuildModule,pdo-pgsql,PDO driver for PostgreSQL,+php5-mod-pdo +PACKAGE_php5-mod-pdo-pgsql:libpq))
$(eval $(call BuildModule,pdo-sqlite,PDO driver for SQLite 3.x,+php5-mod-pdo +PACKAGE_php5-mod-pdo-sqlite:libsqlite3 +PACKAGE_php5-mod-pdo-sqlite:librt))
$(eval $(call BuildModule,pgsql,PostgreSQL,+PACKAGE_php5-mod-pgsql:libpq))
$(eval $(call BuildModule,session,Session))
$(eval $(call BuildModule,shmop,Shared Memory))
$(eval $(call BuildModule,simplexml,SimpleXML,+@PHP5_LIBXML +PACKAGE_php5-mod-simplexml:libxml2))
$(eval $(call BuildModule,soap,SOAP,+@PHP5_LIBXML +PACKAGE_php5-mod-soap:libxml2))
$(eval $(call BuildModule,sockets,Sockets))
$(eval $(call BuildModule,sqlite3,SQLite3,+PACKAGE_php5-mod-sqlite3:libsqlite3))
$(eval $(call BuildModule,sysvmsg,System V messages))
$(eval $(call BuildModule,sysvsem,System V shared memory))
$(eval $(call BuildModule,sysvshm,System V semaphore))
$(eval $(call BuildModule,tokenizer,Tokenizer))
$(eval $(call BuildModule,xml,XML,+PHP5_LIBXML:libxml2 +!PHP5_LIBXML:libexpat))
$(eval $(call BuildModule,xmlreader,XMLReader,+@PHP5_LIBXML +PACKAGE_php5-mod-xmlreader:libxml2 +PACKAGE_php5-mod-xmlreader:libiconv))
# $(eval $(call BuildModule,xmlrpc,XML RPC,+PACKAGE_php5-mod-xmlrpc:libxmlrpc +libiconv +PACKAGE_php5-mod-xmlrpc:libiconv))
$(eval $(call BuildModule,xmlwriter,XMLWriter,+@PHP5_LIBXML +PACKAGE_php5-mod-xmlwriter:libxml2 +PACKAGE_php5-mod-xmlwriter:libiconv))
$(eval $(call BuildModule,zip,ZIP,+PACKAGE_php5-mod-zip:zlib))
