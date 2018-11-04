include $(TOPDIR)/rules.mk

PKG_NAME:=sshpass
PKG_RELEASE:=1.06

PKG_SOURCE:=$(PKG_NAME)-$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=@SF/sshpass
PKG_MD5SUM:=f59695e3b9761fb51be7d795819421f9


PKG_BUILD_DIR :=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_RELEASE)

include $(INCLUDE_DIR)/package.mk

define Package/sshpass
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=sshpass
endef

define Package/sshpass/description
	Sshpass is a tool for non-interactivly performing password authentication with SSH
endef

# define Build/Prepare
#         mkdir -p $(PKG_BUILD_DIR)
#         $(CP) ./src/* $(PKG_BUILD_DIR)/
# endef

define Package/sshpass/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sshpass $(1)/bin/
endef

$(eval $(call BuildPackage,sshpass))
