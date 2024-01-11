#LDD_VERSION = '6bd1bc8bc05a2f1b74dc86f1d05b00cdedbe860d'
#LDD_SITE = 'git@github.com:geraldolsribeiro/ldd3.git'
LDD_VERSION = '2b98cb61b1a6e9cd4b1b0ccebed5877f3d38aa2a'
LDD_SITE = 'git@github.com:geraldolsribeiro/ecen-5713-assignment-7.2.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules skull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED) #INSTALL_MOD_DIR=kernel/drivers/misc

#define LDD_BUILD_CMDS
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull
#endef

define LDD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef

LDD_POST_BUILD_HOOKS += LDD_INSTALL_TARGET_CMDS

$(eval $(kernel-module))
$(eval $(generic-package))
