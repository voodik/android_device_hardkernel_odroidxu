$(call inherit-product, device/hardkernel/odroidxu/full_odroidxu.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := cm_odroidxu
PRODUCT_DEVICE := odroidxu

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=ODROID-XU
