# Compile the kernel inline

# Note for this to work you will need to remove prebuilt kernel building in device tree,
# and any other inline kernel building implementations.

# Original Author Jameson Williams jameson.h.williams@intel.com

ifneq ($(filter %z3,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter carbon%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_shinano_leo_defconfig
  endif
endif

ifneq ($(filter %z3c,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter carbon%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_shinano_aries_defconfig
  endif
endif

ifneq ($(filter %sirius,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter carbon%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_shinano_sirius_defconfig
  endif
endif

ifneq ($(filter %huashan,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8960t
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter carbon%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_huashan_defconfig
  endif
endif

ifdef KERNEL_DIR
  include $(KERNEL_DIR)/AndroidKernel.mk
endif

# cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel
