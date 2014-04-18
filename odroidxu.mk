#
# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/hardkernel/odroidxu

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.odroidxu \
    init.odroidxu.rc \
    init.odroidxu.usb.rc \
    init.odroidxu.wifi.rc \
    lpm.rc \
    ueventd.odroidxu.rc

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.odroidxu.rc

# Audio
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

#PRODUCT_PACKAGES += \
#    audio.a2dp.default \
#    audio.primary.odroidxu \
#    audio.usb.default \
#    mixer_paths.xml \
#    tinymix

# audio
PRODUCT_PACKAGES += \
	audio_policy.odroidxu \
	audio.primary.odroidxu \
	audio.a2dp.default \
	audio.usb.default \
	libaudioutils \
	tinymix
	

# Camera
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/init.exynos.cam.sh:system/etc/init.exynos.cam.sh

PRODUCT_PACKAGES += \
    camera.odroidxu \
    libhwjpeg

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# GPS
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/gps.cer:system/etc/gps.cer \
#    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
#    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

# HW composer
PRODUCT_PACKAGES += \
    hwcomposer.exynos5 \
    libion

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/odroid-ts.idc:system/usr/idc/odroidxu-ts.idc \
    $(LOCAL_PATH)/keylayout/odroid-ts.kl:system/usr/keylayout/odroidxu-ts.kl \
    $(LOCAL_PATH)/keylayout/odroid-keypad.kl:system/usr/keylayout/odroidxu-keypad.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.exynos5

# Lights
PRODUCT_PACKAGES += \
    lights.odroidxu

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# MobiCore
PRODUCT_PACKAGES += \
    mcDriverDaemon


# OMX
PRODUCT_PACKAGES += \
    libExynosOMX_Core \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.AVC.Encoder \
    libstagefrighthw

# Radio
PRODUCT_PACKAGES += \
	rild \
	chat

#Hardkernel
PRODUCT_PACKAGES += \
	OdroidUpdater \
	Utility

# Samsung
#PRODUCT_PACKAGES += \
#    SamsungServiceMode


ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.root_access=3



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage \
    ro.kernel.android.checkjni=0 

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.root_access=3 \
    debug.sf.no_hw_vsync=1 \
    mouse.right.click=back \
    ro.rfkilldisabled=1 \
    wifi.interface=wlan0

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi

PRODUCT_CHARACTERISTICS := tablet

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/hardkernel/odroidxu/odroidxu-vendor.mk)
