THEOS_DEVICE_IP=192.168.0.207
ARCHS=armv7s arm64
TARTGET=iphone:clang:9.2:8.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = preferenceBundleDemo
preferenceBundleDemo_FILES = AdgRootListController.m
preferenceBundleDemo_INSTALL_PATH = /Library/PreferenceBundles
preferenceBundleDemo_FRAMEWORKS = UIKit
preferenceBundleDemo_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/preferenceBundleDemo.plist$(ECHO_END)

after-install::
	install.exec "killall -9 Preferences"