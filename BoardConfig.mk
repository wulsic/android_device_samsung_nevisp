USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/nevisp/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := rhea
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

TARGET_ARCH_LOWMEM := true

TARGET_BOOTLOADER_BOARD_NAME := rhea

# Don't generate block mode update zips
BLOCK_BASED_OTA := false


#Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 mem=456M androidboot.console=ttsyS1 gpt v3d_mem=67108864 pmem=24M@0x9E800000 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2236070912
BOARD_FLASH_BLOCK_SIZE := 131072

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true


TARGET_KERNEL_SOURCE := kernel/samsung/nevisp
TARGET_KERNEL_CONFIG := Cyanogenmod_nevisp_defconfig

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/nevisp/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/nevisp/libbt_vndcfg.txt

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

# Graphics
USE_OPENGL_RENDERER := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_USE_MHEAP_SCREENSHOT := true
ENABLE_WEBGL := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# EGL
BOARD_EGL_CFG := device/samsung/nevisp/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true
MAX_EGL_CACHE_KEY_SIZE := 4096
MAX_EGL_CACHE_SIZE := 2146304
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_FNW := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

#Global Flags for the device patches
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DRHEA_HWC
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DEGL_NEEDS_FNW

# Compat
TARGET_USES_LOGD := false


# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Screen
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Media
TARGET_NO_ADAPTIVE_PLAYBACK := true

# Audio
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/nevisp/ril/

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/nevisp/ramdisk/fstab.rhea_ss_nevisp
BOARD_MDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/nevisp/recovery/recovery_keys.c
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.rhea

# UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"

# jemalloc causes a lot of random crash on free()
MALLOC_IMPL := dlmalloc

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# Use Cpu Upload path (webkit)
TARGET_FORCE_CPU_UPLOAD := true

# Enable Minikin text layout engine
USE_MINIKIN := true

# Use set_perm (no selinux version) instead of set_metadata (selinux version)
USE_SET_METADATA := false

# KitKat uses selinux enforcing mode by default
PRODUCT_PROPERTY_OVERRIDES += \
ro.boot.selinux=permissive

# CMHW
BOARD_HARDWARE_CLASS :=device/samsung/nevisp/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/nevisp/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    service_contexts \
    bkmgrd.te \
    device.te \
    geomagneticd.te \
    gpsd.te \
    init.te \
    immvibed.te \
    kernel.te \
    macloader.te \
    rild.te \
    shell.te \
    system_server.te \
    tvserver.te \
    vclmk.te \


# Skip DroidDoc to save Build Time
BOARD_SKIP_ANDROID_DOC_BUILD := true

#TWRP RECOVERY
#DEVICE_RESOLUTION := 320x480
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_REAL_SDCARD := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/sdcard"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
#TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
#TW_MAX_BRIGHTNESS := 255
#TW_INCLUDE_INJECTTWRP := true
#TWRP_EVENT_LOGGING := false
