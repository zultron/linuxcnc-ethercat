ifeq (, $(COMP))
  COMP = $(shell which halcompile)
endif
ifeq (, $(COMP))
  COMP = $(shell which comp)
endif
ifeq (, $(COMP))
  $(error halcompile/comp executable not found or set)
endif

.PHONY: configure
configure:
	@ {\
	    echo "COMP = $(COMP)"; \
	    echo "MODINC = $(MODINC)"; \
	    echo "BUILDSYS = $(BUILDSYS)"; \
	    echo "KERNELDIR = $(KERNELDIR)"; \
	    echo "CC = $(CC)"; \
	    echo "RTAI = $(RTAI)"; \
	    echo "RTFLAGS += $(RTFLAGS)"; \
	    echo "KERNELRELEASE = $(KERNELRELEASE)"; \
	    echo "EXTRA_CFLAGS += $(EXTRA_CFLAGS)"; \
	    echo "LCEC_CFLAGS = -DCTYPE_H='$(CTYPE_H)'"; \
	    echo "USE_RTLIBM = $(USE_RTLIBM)"; \
	    echo "BINDIR = $(BINDIR)"; \
	    echo "DATAROOTDIR = $(DATAROOTDIR)"; \
	    echo "RUN_IN_PLACE = $(RUN_IN_PLACE)"; \
	    echo "RTLIBDIR = $(RTLIBDIR)"; \
	    echo "LIBDIR = $(LIBDIR)"; \
	    echo "prefix = $(prefix)"; \
	} > config.mk.tmp

# include modinc
MODINC=$(shell $(COMP) --print-modinc)
ifeq (, $(MODINC))
  $(error Unable to get modinc path)
endif

include $(MODINC)

ifneq (,$(HAL_HOME))
$(info Configuring for Machinekit)
BINDIR = $(HAL_HOME)/bin
DATAROOTDIR = $(HAL_HOME)/share
CTYPE_H = <ctype.h>
else
$(info Configuring for LinuxCNC)
BINDIR = $(EMC2_HOME)/bin
DATAROOTDIR = $(EMC2_HOME)/share
CTYPE_H = <rtapi_ctype.h>
endif
