#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from redwood device
$(call inherit-product, device/xiaomi/redwood/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Pribuilt kernel true/false
PREBUILT_KERNEL := false

# Gapps
WITH_GMS := true

# TPP OFFICIAL
CUSTOM_BUILD_TYPE := OFFICIAL
CUSTOM_MAINTAINER := Thereache

# Device props
TARGET_SUPPORTS_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_DISABLE_EPPE := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_SUPPORTS_OMX_SERVICE := false

PRODUCT_BRAND := POCO
PRODUCT_DEVICE := redwood
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 22101320G
PRODUCT_NAME := aosp_redwood

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_SYSTEM_NAME := redwood_global
PRODUCT_SYSTEM_DEVICE := redwood

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="redwood_global-user 14 UKQ1.240624.001 OS2.0.7.0.UMSMIXM release-keys" \
    BuildFingerprint=POCO/redwood_global/redwood:14/UKQ1.240624.001/OS2.0.7.0.UMSMIXM:user/release-keys \
    BuildFlavor=redwood_global-user \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)
