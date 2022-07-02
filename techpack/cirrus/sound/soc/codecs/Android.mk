DLKM_DIR := motorola/kernel/modules
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
ifeq ($(CIRRUS_CS35L41_CODEC),i2c)
KERNEL_CFLAGS += CONFIG_SND_SOC_CS35L41_I2C=y
else
KERNEL_CFLAGS += CONFIG_SND_SOC_CS35L41_SPI=y
endif
LOCAL_MODULE := cirrus_cs35l41.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
LOCAL_ADDITIONAL_DEPENDENCIES := $(KERNEL_MODULES_OUT)/cirrus_wm_adsp.ko
include $(DLKM_DIR)/AndroidKernelModule.mk

ifneq (,$(filter dubai% banks%, $(TARGET_PRODUCT)))
include $(CLEAR_VARS)
ifeq ($(CIRRUS_CS35L45_CODEC),i2c)
KERNEL_CFLAGS += CONFIG_SND_SOC_CS35L45_I2C=y
else
KERNEL_CFLAGS += CONFIG_SND_SOC_CS35L45_SPI=y
endif
LOCAL_MODULE := cirrus_cs35l45.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
LOCAL_ADDITIONAL_DEPENDENCIES := $(KERNEL_MODULES_OUT)/cirrus_wm_adsp.ko
include $(DLKM_DIR)/AndroidKernelModule.mk
endif

include $(CLEAR_VARS)
LOCAL_MODULE := cirrus_cs42l42.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/AndroidKernelModule.mk
