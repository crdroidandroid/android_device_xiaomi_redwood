#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/redwood

BOARD_VENDOR := xiaomi

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# ART
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
TARGET_PROVIDES_AUDIO_EXTNS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := redwood|redwoodin

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Bootloader
TARGET_NO_BOOTLOADER := true

# Board
TARGET_BOOTLOADER_BOARD_NAME := redwood

# Display
TARGET_SCREEN_DENSITY ?= 411

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# HWUI
HWUI_COMPILE_FOR_PERF := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# HIDL
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/hidl/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml \
    hardware/xiaomi/vintf/xiaomi_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/hidl/manifest_lahaina.xml \
    $(DEVICE_PATH)/hidl/manifest_xiaomi.xml

# Ignore overriding commands errors
BUILD_BROKEN_DUP_RULES := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_KERNEL_ADDITIONAL_FLAGS := TARGET_PRODUCT=$(PRODUCT_DEVICE)
TARGET_KERNEL_NO_GCC := true

BOARD_KERNEL_CMDLINE += \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.init_fatal_reboot_target=recovery \
    androidboot.usbcontroller=a600000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    iptable_raw.raw_before_defrag=1 \
    ip6table_raw.raw_before_defrag=1 \
    kpti=off \
    loop.max_part=7 \
    msm_rtb.filter=0x237 \
    pcie_ports=compat \
    service_locator.enable=1 \
    swiotlb=noforce
	
# Kernel Clang Flags
KERNEL_CC := CC=clang
override KERNEL_TOOLCHAIN_PREFIX_arm := arm-linux-android-

# Kernel
ifeq ($(PREBUILT_KERNEL),true)
KERNEL_PATH := device/xiaomi/redwood-kernel
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(BOARD_PREBUILT_DTBIMAGE_DIR)/01_dtbdump_Qualcomm_Technologies,_Inc._Yupik_SoC.dtb
else
TARGET_KERNEL_SOURCE := kernel/xiaomi/redwood
TARGET_KERNEL_CONFIG := vendor/xiaomi-qgki_defconfig vendor/debugfs.config
TARGET_KERNEL_CONFIG += vendor/redwood.config
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_USES_METADATA_PARTITION := true

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm system system_ext vendor product
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # BOARD_SUPER_PARTITION_SIZE - 4MB

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 113254576128

ifeq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 104857600
else
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1887436800
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1887436800
endif
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 104857600

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Platform
TARGET_BOARD_PLATFORM := lahaina

# Properties
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/props/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2025-06-01

# Sepolicy
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
include device/qcom/sepolicy_vndr/SEPolicy.mk

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# SurfaceFlinger
TARGET_USE_AOSP_SURFACEFLINGER := true

## torch control ##
TARGET_CAMERA_SERVICE_EXT_LIB := //$(DEVICE_PATH):libcameraservice_extension.redwood

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
CONFIG_ACS := true
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := wlan
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_FEATURE_HOSTAPD_11AX := true
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit proprietary blobs
include vendor/xiaomi/redwood/BoardConfigVendor.mk

# Firmware
-include vendor/xiaomi/redwood-firmware/BoardConfigVendor.mk
