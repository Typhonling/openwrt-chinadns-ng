include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-chinadns-ng
PKG_VERSION:=1.2
PKG_RELEASE:=1

LUCI_TITLE:=LuCI support for chinadns-ng
LUCI_DESCRIPTION:=LuCI Support for chinadns-ng.
LUCI_DEPENDS:=+chinadns-ng +wget
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Package/chinadns-ng/conffiles
/etc/chinadns-ng/whitelist.txt
/etc/chinadns-ng/blacklist.txt
endef

# call BuildPackage - OpenWrt buildroot signature
