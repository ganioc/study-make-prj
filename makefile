CC = gcc
AR = ar
CFLAGS = 
INCLUDES = 
CPPFLAGS = -I .
LDFLAGS  = -L ./
VPATH = ./ src include
LIBS = -lfunny 

OBJS = main.o
ARS = libfunny.a
SOURCES = 
ARFLAGS = r 

# help
.PHONY: help
.PHONY: clean
.PHONY: libs

main:$(OBJS) libfunny.a
	$(CC)  $^ -o $@ $(LIBS) $(LDFLAGS)

%.o:%.c 
	$(CC) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -c $<

libfunny.a : funny.o
	rm -f $@
	$(AR) $(ARFLAGS) $@ $<
	ranlib $@

depend: main.c 
	$(CC) -M $(CPPFLAGS) $^ > $@

include depend


help:
	$(MAKE) --print-data-base --question \
	$(AWK) '/^[^.%][-A-Za-z0-9_]*:/ \
	{ print substr($$1, 1, length($$1) - 1) }'

clean:
	rm -f main
	rm -f *.o 
	rm -f *.a

