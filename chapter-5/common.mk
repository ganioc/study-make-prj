MV       := mv -f
RM       := rm -f
SED      := sed 
AR       := ar 
CC       := gcc


objects      := $(subst .c,.o,$(sources))
dependencies := $(subst .c,.d,$(sources))
include_dirs := ../../include 

CPPFLAGS     += $(addprefix -I ,$(include_dirs))
ARFLAGS      := rv

vpath %.h $(include_dirs)

.PHONY: library 
library: $(library)

$(library): $(objects)
	$(AR) $(ARFLAGS) $@ $^

.PHONY : clean
clean: 
	$(RM) $(objects) $(program) $(library) $(dependencies) $(extra_clean)

%.o : %.c 
	$(CC) -c $(CPPFLAGS) $< -o $@
