CC = gcc
AR = ar
CFLAGS = 
INCLUDES = 
CPPFLAGS = -I .
LDFLAGS  = -L ./
VPATH = 
LIBS = -lfunny 

OBJS = main.o
OBJS_HELP = main.o play.o dust.o
ARS = libfunny.a
SOURCES = 
ARFLAGS = r 

BIN:=/usr/bin
PRINTF:=$(BIN)/printf 
DF    :=/bin/df 
AWK   :=$(BIN)/awk 

include definitions.mk 

# help
.PHONY: help
.PHONY: clean
.PHONY: libs
.PHONY: test

# Macro
define free-space
	$(PRINTF) "Free disk space "
	$(DF) . | $(AWK) 'NR == 2 { print $$4 }'
endef

main:$(OBJS) libfunny.a
	$(CC)  $^ -o $@ $(LIBS) $(LDFLAGS)

depend: main.c 
	$(CC) -M $(CPPFLAGS) $^ > $@
	
# include depend

%.o:%.c 
	$(CC) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -c $<

libfunny.a : funny.o
	rm -f $@
	$(AR) $(ARFLAGS) $@ $<
	ranlib $@

libs: 
	echo "Create libs"
help:
	# $(MAKE) --print-data-base --question \
	# $(AWK) '/^[^.%][-A-Za-z0-9_]*:/ \
	# { print substr($$1, 1, length($$1) - 1) }'
	@echo "make help ==>"
	$(free-space)
	@echo $(AUTHOR_NAME)
	$(warning "Finished Included")
	@echo $(MAKE_VERSION)
	@echo "Current directory:" $(CURDIR)
	@echo "makefile list:" $(MAKEFILE_LIST)
	@echo "makecmdgoals:" $(MAKECMDGOALS)
	@echo $(subst .o,.txt,$(OBJS_HELP))
	@echo ".VARIABLES:" "$(.VARIABLES)"

clean:
	rm -f main
	rm -f *.o 
	rm -f *.a

test:
	@echo "hello, this is a test";
	# @echo "xx";