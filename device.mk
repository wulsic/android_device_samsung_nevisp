# Call up some makefiles
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/samsung/nevisp/nevisp-vendor.mk)
$(call inherit-product, device/samsung/rhea-common/rhea.mk)

# MDPI assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Init file
PRODUCT_COPY_FILES += \
	device/samsung/nevisp/rootdir/init.rhea_ss_nevisp.rc:root/init.rhea_ss_nevisp.rc \
        device/samsung/rhea-common/rootdir/fstab.rhea:root/fstab.rhea_ss_nevisp.rc

# libinit
PRODUCT_PACKAGES += \
        libinit_rhea_ss

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_nevisp
PRODUCT_DEVICE := nevisp
