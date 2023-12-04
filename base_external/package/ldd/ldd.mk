LDD_VERSION = '258da250dac7946ab63a70f8d23335eed3e65f20'
LDD_SITE = 'git@github.com:geraldolsribeiro/ldd3.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull misc-modules
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED) INSTALL_MOD_DIR=kernel/drivers/misc

define LDD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/scull/scull.init $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(kernel-module))
$(eval $(generic-package))

