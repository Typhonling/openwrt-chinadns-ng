include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-chinadns-ng
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

LUCI_TITLE:=LuCI support for chinadns-ng
LUCI_DESCRIPTION:=LuCI Support for chinadns-ng.
LUCI_DEPENDS:=+chinadns-ng +wget
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/po/zh-cn/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Package/chinadns-ng/conffiles
/etc/chinadns-ng/whitelist.txt
/etc/chinadns-ng/blacklist.txt
endef

define Package/(PKG_NAME)/install
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/chinadns-ng*.lmo $(1)/usr/lib/lua/luci/i18n/
endef
# call BuildPackage - OpenWrt buildroot signature
