include ../config.mk

EXTRA_CFLAGS := $(filter-out -Wframe-larger-than=%,$(EXTRA_CFLAGS)) \
	$(LCEC_CFLAGS)

LCEC_CONF_OBJS = \
	lcec_conf.o \
	lcec_conf_util.o \
	lcec_conf_icmds.o \

.PHONY: all clean install

all: lcec_conf

install: lcec_conf
	mkdir -p $(DESTDIR)$(BINDIR)
	cp lcec_conf $(DESTDIR)$(BINDIR)

lcec_conf: $(LCEC_CONF_OBJS)
	@echo Compiling $@
	$(CC) -o $@ $(CFLAGS) $(LCEC_CONF_OBJS) \
	    -Wl,-rpath,$(LIBDIR) -L$(LIBDIR) -llinuxcnchal -lexpat

%.o: %.c
	@echo Compiling ULAPI $@
	$(CC) -o $@ $(CFLAGS) $(EXTRA_CFLAGS) \
	    -URTAPI -U__MODULE__ -DULAPI -Os -c $<

