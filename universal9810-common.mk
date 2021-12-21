# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2021 The LineageOS Project

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Screen density
# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_SCREEN_HEIGHT := 2960
TARGET_SCREEN_WIDTH := 1440

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.picture_in_picture.xml \
    frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.controls.xml

# Rootdir
PRODUCT_PACKAGES += \
    fstab.samsungexynos9810_ramdisk \
    fstab.samsungexynos9810 \
    init.samsungexynos9810.root.rc \
    init.samsungexynos9810.rc \
    init.samsungexynos9810.usb.rc

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.samsungexynos9810.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_configuration.xml

# SP-NDK
PRODUCT_PACKAGES += \
    libvulkan

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/libnfc-sec-vendor.conf:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/libnfc-sec-vendor.conf

# LiveDisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service.9810

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.9810

# FastCharge
PRODUCT_PACKAGES += \
    lineage.fastcharge@1.0-service.9810

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.9810

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hidl/vibrator/vendor.samsung.hardware.vibrator@2.1-service:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/bin/hw/vendor.samsung.hardware.vibrator@2.1-service \
    $(LOCAL_PATH)/hidl/vibrator/vendor.samsung.hardware.vibrator@2.1-service.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/init/vendor.samsung.hardware.vibrator@2.1-service.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hidl/sensors/lib/android.hardware.sensors@1.0-impl.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib/hw/android.hardware.sensors@1.0-impl.so \
    $(LOCAL_PATH)/hidl/sensors/lib64/android.hardware.sensors@1.0-impl.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib64/hw/android.hardware.sensors@1.0-impl.so

# Ringtones
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/audio/ringtones/Xylophone_Dubstep.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Xylophone_Dubstep.ogg

# S-Pen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/samsung-sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl

# liboemcrypto.so
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/null:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib/liboemcrypto.so

# Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Property overrides
-include $(LOCAL_PATH)/product_prop.mk
-include $(LOCAL_PATH)/system_prop.mk

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/universal9810-common/universal9810-common-vendor.mk)
