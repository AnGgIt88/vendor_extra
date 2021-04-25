LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

# apn-conf
PRODUCT_COPY_FILES += \
    vendor/extra/config/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Face Unlock
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml

# Flipendo
PRODUCT_COPY_FILES += \
    vendor/extra/config/sysconfig/flipendo-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/flipendo-sysconfig.xml

PRODUCT_PACKAGES += \
    Flipendo

BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/extra/sepolicy/dynamic

# Google Wallpaper
PRODUCT_PACKAGES += \
    WallpaperPickerGoogleRelease

PRODUCT_COPY_FILES += \
    vendor/extra/config/permissions/googlewallpaper-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/googlewallpaper-hiddenapi-package-whitelist.xml \
    vendor/extra/config/permissions/privapp-permissions-googlewallpaper.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-googlewallpaper.xml

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/extra/overlay/common

DEVICE_PACKAGE_OVERLAYS += \
    vendor/extra/overlay/common
