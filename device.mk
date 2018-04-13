DEVICE_FOLDER := device/amazon/thor

# Disable ext sdcard
PRODUCT_CHARACTERISTICS := \
	tablet,nosdcard

# Inherit from hdx
$(call inherit-product, device/amazon/hdx-common/hdx-common.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/thor/thor-vendor.mk)
# Adreno libs
$(call inherit-product-if-exists, vendor/amazon/adreno-330/adreno-330-vendor.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# configs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:system/vendor/etc/wifi/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/configs/thermal-engine.conf:system/vendor/etc/thermal-engine.conf
