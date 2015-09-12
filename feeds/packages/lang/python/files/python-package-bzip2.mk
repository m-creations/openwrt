#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


define Package/python-bzip2
$(call Package/python/Default)
  TITLE:=Python $(PYTHON_VERSION) support for Bzip2
  DEPENDS:=+python-light +libbz2
endef

$(eval $(call PyBasePackage,python-bzip2, \
	/usr/lib/python$(PYTHON_VERSION)/encodings/bz2_codec.py \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_elementtree.so \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/bz2.so \
))
