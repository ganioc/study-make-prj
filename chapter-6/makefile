programs        :=
sources         :=
libraries       :=
extra_clean     :=

objects          = $(subst .c,.o,$(sources))
dependencies     = $(subst .c,.d,$(sources))

include_dirs    := lib include 
CPPFLAGS        += $(addprefix -I ,$(include_dirs))
vpath %.h $(include_dirs)

MV   := mv -f 
RM   := rm -f 
SED  := sed 

all:

include lib/codec/module.mk
include lib/db/module.mk




