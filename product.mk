LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

# apn-conf
PRODUCT_COPY_FILES += \
    vendor/extra/config/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Blurs
# Enable blurs, hidden under dev option
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1 \
    persist.sys.sf.disable_blurs=1

# Hint expensive blurs for device with larger display
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1

# Build Fingerprint
TARGET_FORCE_BUILD_FINGERPRINT := google/crosshatch/crosshatch:11/RQ2A.210505.002/7246365:user/release-keys

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

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/extra/overlay/common

DEVICE_PACKAGE_OVERLAYS += \
    vendor/extra/overlay/common \
    vendor/extra/overlay/device

# QTI-Telephony Jar
PRODUCT_COPY_FILES += \
    vendor/extra/proprietary/system_ext/framework/qti-telephony-common.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/qti-telephony-common.jar
