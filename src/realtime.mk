include ../config.mk
include Kbuild

include $(MODINC)

ifeq ($(BUILDSYS),kbuild)

all:
	$(MAKE) KBUILD_EXTRA_SYMBOLS="$(RTLIBDIR)/Module.symvers $(RTAIDIR)/modules/ethercat/Module.symvers" -C $(KERNELDIR) SUBDIRS=`pwd` CC=$(CC) V=0 modules

else

LDFLAGS += -Wl,-rpath,$(LIBDIR) -L$(LIBDIR) -llinuxcnchal -lethercat

module-dir:
	test -d "$(DESTDIR)$(EMC2_RTLIB_DIR)" || \
	    mkdir -p "$(DESTDIR)$(EMC2_RTLIB_DIR)"
install:  module-dir

all: modules

endif

