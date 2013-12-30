################################################################################
#
# UIOCTL
#
################################################################################

UIOCTL_SITE = https://raw.github.com/leaflabs/uioctl/master/
UIOCTL_SOURCE = uioctl.c
UIOCTL_VERSION = 1

define UIOCTL_EXTRACT_CMDS
	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
endef

define UIOCTL_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) uioctl
endef

define UIOCTL_CLEAN_CMDS
	rm -f $(@D)/uioctl
endef

define UIOCTL_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/uioctl $(TARGET_DIR)/sbin/uioctl
endef

define UIOCTL_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/sbin/uioctl
endef

$(eval $(generic-package))
