DEVICE_TREE := device/sony/kagura

TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw # Lineage
override TARGET_OUT_VENDOR_SHARED_LIBRARIES = $(TARGET_OUT_SHARED_LIBRARIES)

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := F8332

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

TARGET_USES_ION := true

# GFX
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Include build helpers for QCOM proprietary
-include vendor/qcom/proprietary/common/build/proprietary-build.mk

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=16M@0-0xffffffff coherent_pool=2M enforcing=0 androidboot.selinux=permissive

# Boot image
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET := 0x02200000
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 cma=16M@0-0xffffffff coherent_pool=2M
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# prebuilt kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_MODULES := true
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := device/sony/kagura/Image.gz-dtb

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5513412608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57436708864
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_64_BIT_BINDER := true

# File systems
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true

BLOCK_BASED_OTA := false

BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_FSTAB = device/sony/kagura/recovery.fstab
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/6a00000.ssusb/6a00000.dwc3/gadget/lun%d/file"
TW_HAS_NO_RECOVERY_PARTITION := true
TW_IGNORE_ABS_MT_TRACKING_ID := true
TW_INCLUDE_FUSE_EXFAT := true
TW_NEW_ION_HEAP := true
TW_BRIGHTNESS_PATH := "/sys/devices/soc/900000.qcom\x2cmdss_mdp/900000.qcom\x2cmdss_mdp:qcom\x2cmdss_fb_primary/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone4/temp

# No love for the wicked (device ships with M)
TW_EXCLUDE_SUPERSU := true

# Asian region languages
TW_EXTRA_LANGUAGES := true

# Encryption support
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Debug flags
TWRP_INCLUDE_LOGCAT := true
# TWRP_INCLUDE_LOGCAT := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# SELINUX
TARGET_SKIP_SETEXECCON_VOLD_CHECK := true
BOARD_SEPOLICY_DIRS += device/sony/kagura/sepolicy
