#
#   Instance/java.make
#
#   Instance Makefile rules to build java-based (not necessarily
#   GNUstep) packages.
#
#   Copyright (C) 2000 Free Software Foundation, Inc.
#
#   Author:  Nicola Pero <nicola@brainstorm.co.uk> 
#
#   This file is part of the GNUstep Makefile Package.
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 2
#   of the License, or (at your option) any later version.
#   
#   You should have received a copy of the GNU General Public
#   License along with this library; see the file COPYING.LIB.
#   If not, write to the Free Software Foundation,
#   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

ifeq ($(RULES_MAKE_LOADED),)
include $(GNUSTEP_MAKEFILES)/rules.make
endif

#
# You can compile any set of java classes, it does not need to be strictly 
# a single package in the java sense.  Please put a single class in each 
# source file.  Multiple classes in a single source file are not supported.
#
# The name of the Java package is in the JAVA_PACKAGE_NAME variable.
# The java files to be compiled are in the xxx_JAVA_FILES variable;
# they should be specified in full relative path, such as: 
# test_JAVA_FILES = gnu/gnustep/base/NSArray.java
#
# The relative path is important because things will be installed 
# in $(JAVA_INSTALLATION_DIR)/{relative_path}; for example, 
# the file above would be installed in 
# ${JAVA_INSTALLATION_DIR)/gnu/gnustep/base/NSArray.class
#
# JAVA_INSTALLATION_DIR contains the directory where you want to
# install your classes - it defaults to $(GNUSTEP_JAVA), which is
# $(GNUSTEP_LOCAL_ROOT)/Libraries/Java/.
#
# If you have all your files in a directory but want them to be
# installed with a different relative path, you can simply redefine 
# JAVA_INSTALLATION_DIR, as in the following example - 
# JAVA_INSTALLATION_DIR = $(GNUSTEP_JAVA)/gnu/gnustep/base/
#
# If you have java sources to be processed throught JAVAH to create
# JNI headers, specify the files in xxx_JAVA_JNI_FILES.  The headers
# will be placed together with the source file (example: the header of
# gnu/gnustep/base/NSObject.java will be created as
# gnu/gnustep/base/NSObject.h) These headers are not installed.
#
# If you have properties file to install, put them in the
# xxx_JAVA_PROPERTIES_FILES

.PHONY: internal-java_package-all \
        internal-java_package-clean \
        internal-java_package-distclean \
        internal-java_package-install \
        internal-java_package-uninstall \
        before-$(GNUSTEP_INSTANCE)-all \
        after-$(GNUSTEP_INSTANCE)-all

# This is the directory where the java classses get
# installed. Normally this is /usr/GNUstep/Local/Libraries/Java/
ifeq ($(JAVA_INSTALLATION_DIR),)
JAVA_INSTALLATION_DIR = $(GNUSTEP_JAVA)
endif

GNUSTEP_SHARED_JAVA_INSTALLATION_DIR = $(JAVA_INSTALLATION_DIR)
include $(GNUSTEP_MAKEFILES)/Instance/Shared/java.make


internal-java_package-all:: before-$(GNUSTEP_INSTANCE)-all \
                               shared-instance-java-all \
                               after-$(GNUSTEP_INSTANCE)-all

before-$(GNUSTEP_INSTANCE)-all::

after-$(GNUSTEP_INSTANCE)-all::

internal-java_package-install:: shared-instance-java-install

internal-java_package-clean:: shared-instance-java-clean

internal-java_package-distclean::

internal-java_package-uninstall:: shared-instance-java-uninstall


## Local variables:
## mode: makefile
## End:
