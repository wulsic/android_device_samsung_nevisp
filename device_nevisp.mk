#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Inherit the proprietary vendors blobs for Samsung Galaxy fame.
$(call inherit-product-if-exists, vendor/samsung/nevisp/nevisp-vendor.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# MDPI assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
#$(call inherit-product, device/mdpi-common/mdpi.mk)

# Ramdisk Init files
PRODUCT_COPY_FILES += \
	device/samsung/nevisp/rootdir/init.rhea_ss_nevisp.rc:root/init.rhea_ss_nevisp.rc \
	device/samsung/nevisp/rootdir/init.bcm2165x.usb.rc:root/init.bcm2165x.usb.rc \
	device/samsung/nevisp/rootdir/init.log.rc:root/init.log.rc \
	device/samsung/nevisp/rootdir/init.bt.rc:root/init.bt.rc \
	device/samsung/nevisp/rootdir/init.rc:root/init.rc \
	device/samsung/nevisp/rootdir/lpm.rc:root/lpm.rc \
	device/samsung/nevisp/rootdir/ueventd.rhea_ss_nevisp.rc:root/ueventd.rhea_ss_nevisp.rc \
        device/samsung/nevisp/rootdir/init.recovery.rhea_ss_nevisp.rc:root/init.recovery.rhea_ss_nevisp.rc \
	device/samsung/nevisp/rootdir/fstab.rhea_ss_nevisp:root/fstab.rhea_ss_nevisp 
	
PRODUCT_COPY_FILES += \
 	device/samsung/nevisp/rootdir/vold.fstab:system/etc/vold.fstab 

# Graphics
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/lib/egl/egl.cfg:system/lib/egl/egl.cfg
PRODUCT_PACKAGES += \
    libblt_hw
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    persist.sys.use_dithering=2 \
    persist.sys.strictmode.disable=1

#Samsung framework files (TEST NOT FOR MASTER BRANCH YET)
PRODUCT_COPY_FILES += \
        device/samsung/nevisp/prebuilt/secframeworks/seccamera.jar:system/framework/seccamera.jar \
        device/samsung/nevisp/prebuilt/secframeworks/sec_edm.jar:system/framework/sec_edm.jar \
        device/samsung/nevisp/prebuilt/secframeworks/secface.jar:system/framework/secface.jar \
        device/samsung/nevisp/prebuilt/secframeworks/sec_feature.jar:system/framework/sec_feature.jar \
        device/samsung/nevisp/prebuilt/secframeworks/sechardware.jar:system/framework/sechardware.jar \
        device/samsung/nevisp/prebuilt/secframeworks/secmediarecorder.jar:system/framework/secmediarecorder.jar \
        device/samsung/nevisp/prebuilt/secframeworks/sec_platform_library.jar:system/framework/sec_platform_library.jar \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml 
PRODUCT_PROPERTY_OVERRIDES += \
    ste.nmf.autoidle=1 \
    ste.video.dec.mpeg4.in.size=8192 \
    ste.video.enc.out.buffercnt=5 \
    ste.video.dec.recycle.delay=1 \
    ste.omx.ctx=0

# Screen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    ro.sf.display_rotation=0 \
    ro.lcd_brightness=170 \
    ro.lcd_min_brightness=30

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ste.cam.front.orientation=270 \
    ste.cam.back.orientation=90 \
    ste.cam.ext.cfg.path.secondary=/system/cameradata/datapattern_front_420sp.yuv

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
PRODUCT_PACKAGES += \
    libnetcmdiface
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf	
	
# Wifi/Ril
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL 
	
# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sirfgps.conf:system/etc/sirfgps.conf \
    $(LOCAL_PATH)/configs/etc/gps.conf:system/etc/gps.conf

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf 
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    libasound

# Sensors
PRODUCT_PACKAGES += \
    lights.rhea

# Power

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1 \
    ste.special_fast_dormancy=false	
	
# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/nevisp/keymaps/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/nevisp/keymaps/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/nevisp/keymaps/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/nevisp/keymaps/Generic.kl:system/usr/keylayout/Generic.kl \
	device/samsung/nevisp/keymaps/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl 


# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode 
	
# Misc packages
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

# Misc packages

# Non-device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes
	
# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs
    
# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL \
    ro.zygote.disable_gl_preload=true \
    persist.radio.multisim.config=dsds \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.call_ring=0 \
    ro.config.low_ram=true
    
# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libbrcm_ril.so \
    ro.ril.disable.power.collapse=0 \
    ro.ril.gprsclass=10 \
    ro.ril.hsxpa=1 \
    ro.telephony.call_ring.delay=0 \
    ro.telephony.default_network=0 \
    ro.telephony.ril.v3=icccardstatus,datacall,signalstrength,facilitylock

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_nevisp
PRODUCT_DEVICE := nevisp


