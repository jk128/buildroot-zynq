################################################################################
#
# python-ws4py
#
################################################################################

PYTHON_WS4PY_VERSION = 0.3.2
PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
PYTHON_WS4PY_SITE = https://pypi.python.org/packages/source/w/ws4py/

PYTHON_WS4PY_DEPENDENCIES = python python-werkzeug host-python host-python-setuptools

define PYTHON_WS4PY_BUILD_CMDS
    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_WS4PY_INSTALL_TARGET_CMDS
	(cd $(@D); \
	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
	$(HOST_DIR)/usr/bin/python setup.py install \
	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
