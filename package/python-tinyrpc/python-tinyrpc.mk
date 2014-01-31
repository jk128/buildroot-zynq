################################################################################
#
# python-tinyrpc
#
################################################################################

PYTHON_TINYRPC_VERSION = 0.5
PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
PYTHON_TINYRPC_SITE = https://pypi.python.org/packages/source/t/tinyrpc/

PYTHON_TINYRPC_DEPENDENCIES = python host-python host-python-setuptools

define PYTHON_TINYRPC_BUILD_CMDS
    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_TINYRPC_INSTALL_TARGET_CMDS
	(cd $(@D); \
	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
	$(HOST_DIR)/usr/bin/python setup.py install \
	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
