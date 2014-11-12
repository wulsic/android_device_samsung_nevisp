BOARD_USES_GENERIC_AUDIO := true

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/corsica/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := rhea
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

TARGET_ARCH_LOWMEM := true

TARGET_BOOTLOADER_BOARD_NAME := rhea

BOARD_KERNEL_CMDLINE := console=ttyS0,115200n8 mem=456M androidboot.console=ttyS0 gpt v3d_mem=67108864 pmem=24M@0x9E800000
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1002438656
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2173139968
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel
TARGET_PREBUILT_KERNEL := device/samsung/corsica/kernel

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Audio
BOARD_USES_ALSA_AUDIO := true

#Device Resolution
DEVICE_RESOLUTION := 240x240

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/corsica/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/corsica/libbt_vndcfg.txt

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
BOARD_EGL_CFG := device/samsung/corsica/egl.cfg
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_FNW := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DEGL_NEEDS_FNW

OVERRIDE_RS_DRIVER := libRSDriverArm.so

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Flags
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS -DSAMSUNG_BCM_AUDIO_BLOB

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/corsica/ril/

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/corsica/fstab.rhea_ss_corsica
BOARD_LDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/corsica/recovery/recovery_keys.c
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 18
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.rhea

# Apps on External SD card
TARGET_EXTERNAL_APPS = sdcard1

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ device/samsung/corsica/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/corsica/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \

#twrp
#DEVICE_RESOLUTION := 240x320
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
