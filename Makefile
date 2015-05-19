#
# Copyright (c) 2000,2003,2004 Silicon Graphics, Inc.  All Rights Reserved.
# 
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#

SHELL	= sh

ifdef PCP_CONF
include $(PCP_CONF)
else
include $(PCP_DIR)/etc/pcp.conf
endif
include $(PCP_INC_DIR)/builddefs

# remove -Lpath and -Ipath options from builddefs CFLAGS value
#
PCP_LIBS        =
TMP             := $(CFLAGS:-I%=)
ifdef PCP_DIR
# put -Ipath and -Lpath back but use paths for run-time environment
#
CFLAGS          = $(TMP) -I$(PCP_INC_DIR)/..
LDFLAGS         = -L$(PCP_LIB_DIR)
else
CFLAGS          = $(TMP)
endif

IAM	= generic
CFILES	= $(IAM).c

LIBTARGET = pmda_$(IAM).$(DSOSUFFIX)
CMDTARGET = pmda$(IAM)
TARGETS = $(LIBTARGET) $(CMDTARGET)

LLDLIBS	= -lpcp_pmda -lpcp $(LIB_FOR_MATH) $(LIB_FOR_PTHREADS)
LDIRT	= *.log help.dir help.pag

default: $(TARGETS)

install: default

include $(PCP_INC_DIR)/buildrules
