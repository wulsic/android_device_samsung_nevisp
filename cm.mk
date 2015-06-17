## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := GalaxyFame

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/nevisp/device_nevisp.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nevisp
PRODUCT_NAME := cm_nevisp
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S6810P
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nevisp TARGET_DEVICE=nevisp BUILD_FINGERPRINT=samsung/nevispxx/nevisp:4.1.2/JZO54K/S6810PXXAMJ1:user/release-keys PRIVATE_BUILD_DESC="nevisp-user 4.1.2 JZO54K S6810PXXAMJ1 release-keys"
