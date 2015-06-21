## Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := GalaxyFame

# Inherit Omni GSM telephony parts
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit some common Omni stuff
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nevisp
PRODUCT_NAME := omni_nevisp
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S6810P
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nevisp TARGET_DEVICE=nevisp BUILD_FINGERPRINT=samsung/nevispxx/nevisp:4.1.2/JZO54K/S6810PXXAMJ1:user/release-keys PRIVATE_BUILD_DESC="nevisp-user 4.1.2 JZO54K S6810PXXAMJ1 release-keys"
