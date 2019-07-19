BUILD_ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))


SPL_PATH = $(BUILD_ROOT)/stm_spl/
COMMON_PATH = $(BUILD_ROOT)/common
LABS_DIR = $(BUILD_ROOT)/projects

.PHONY: labs spl common lab clean

all: labs

labs: lab

spl:
	make -C $(SPL_PATH)

common:
	make -C $(COMMON_PATH)

lab: spl common
	make -C $(LABS_DIR)/wav-player

clean:
	make -C $(SPL_PATH) clean
	make -C $(COMMON_PATH) clean
	make -C $(LABS_DIR)/wav-player clean
