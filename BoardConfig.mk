USE_CAMERA_STUB := true

# legacy MMAP 
BOARD_USES_LEGACY_MMAP := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# inherit from the proprietary version
-include vendor/samsung/nevisp/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := rhea
TARGET_BOARD_PLATFORM := rhea
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true

TARGET_ARCH_LOWMEM := true
TARGET_BOOTLOADER_BOARD_NAME := rhea

# Optimisations
TARGET_USE_SCORPIAN_BIONIC_OPTIMIZATION := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
TARGET_GRALLOC_USES_ASHMEM := true
BOARD_WANTS_EMMC_BOOT := true

# cortex-a9 is used to take advantage of NEON optimizations
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4330
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Power
TARGET_PROVIDES_POWER_HAL := true

# Kernel
#TARGET_KERNEL_SOURCE := kernel/samsung/nevisp
#TARGET_KERNEL_CONFIG := cyanogenmod_nevisp_defconfig
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 mem=456M androidboot.console=ttyS1 gpt v3d_mem=67108864 pmem=24M@0x9E800000
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096

# Prebuilt kernel
TARGET_PREBUILT_KERNEL := device/samsung/nevisp/kernel/zImage

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2236070912
BOARD_FLASH_BLOCK_SIZE := 131072

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Device Resolution
DEVICE_RESOLUTION := 320x480

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/nevisp/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/nevisp/bluetooth/libbt_vndcfg.txt

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/wifi/bcmdhd_p2p.bin_b2"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   := 802_11_ABG

# Wi-Fi Tethering
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_NO_APSME_ATTR := true

# Hardware rendering
USE_OPENGL_RENDERER := true
HWUI_COMPILE_FOR_PERF := true
BOARD_EGL_CFG := device/samsung/nevisp/configs/egl.cfg
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_FNW := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DEGL_NEEDS_FNW -DMR0_AUDIO_BLOB -DSAMSUNG_BCM_AUDIO_BLOB -DRHEA_HWC -DSAMSUNG_BCM_AUDIO_BLOB -DRHEA_HWC
OVERRIDE_RS_DRIVER := libRSDriverArm_rhea.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
BOARD_USES_HW_MEDIARECORDER := true
BOARD_USES_HW_MEDIAPLUGINS := true
BOARD_USE_SCREENCAP := true
TARGET_USES_GL_VENDOR_EXTENSIONS := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Screen
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/nevisp/ril/

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/nevisp/recovery/fstab.rhea_ss_nevisp
BOARD_MDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/nevisp/recovery/recovery_keys.c
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 18
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# dumpstate
BOARD_HAL_STATIC_LIBRARIES := libdumpstate.rhea

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.rhea

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ device/samsung/nevisp/cmhw/

# jemalloc causes a lot of random crash on free()
MALLOC_IMPL := dlmalloc

# Compat
TARGET_USES_LOGD := false

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/nevisp/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    surfaceflinger.te \
    init.te \
    shell.te \
    netd.te \
    device.te \
    rild.te \ 
