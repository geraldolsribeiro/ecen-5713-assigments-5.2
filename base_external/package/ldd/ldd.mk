LDD_VERSION = '6bd1bc8bc05a2f1b74dc86f1d05b00cdedbe860d'
LDD_SITE = 'git@github.com:geraldolsribeiro/ldd3.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull misc-modules
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED) INSTALL_MOD_DIR=kernel/drivers/misc

define LDD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/scull/scull.init $(TARGET_DIR)/etc/init.d/S98lddmodules
 	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/misc-modules/faulty.init $(TARGET_DIR)/etc/init.d/S99faultymodules
endef

$(eval $(kernel-module))
$(eval $(generic-package))

