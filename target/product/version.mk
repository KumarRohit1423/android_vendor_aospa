# Copyright (C) 2022 Paranoid Android
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
# Handle various build version information.
#
# Guarantees that the following are defined:
#     AOSPA_MAJOR_VERSION
#     AOSPA_MINOR_VERSION
#     AOSPA_BUILD_VARIANT
#

# This is the global AOSPA version flavor that determines the focal point
# behind our releases. This is bundled alongside $(AOSPA_MINOR_VERSION)
# and only changes per major Android releases.
AOSPA_MAJOR_VERSION := 15

SOMETHINGOS_VERSION := 2.0

# The version code is the upgradable portion during the cycle of
# every major Android release. Each version code upgrade indicates
# our own major release during each lifecycle.
# It is based in three parts
# X for SPL changes, Y for week, and Z for hotfix.

# Build Date
BUILD_DATE := $(shell date -u +%Y%m%d)

# AOSPA Version
AOSPA_VERSION := $(SOMETHINGOS_VERSION)-
AOSPA_DISPLAY_VERSION := $(SOMETHINGOS_VERSION)

# Add BUILD_DATE for zip naming
AOSPA_VERSION += $(AOSPA_BUILD)-$(BUILD_DATE)

# Updater version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.somethingos.version=$(SOMETHINGOS_VERSION)

# Remove unwanted characters for zip naming
AOSPA_VERSION := $(shell echo -n $(AOSPA_VERSION) | tr -d '[:space:]')
