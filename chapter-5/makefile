lib_codec:= lib/codec
lib_db:= lib/db
lib_ui := lib/ui 
libraries := $(lib_ui) $(lib_db) $(lib_codec)
player := app/player

.PHONY : all $(player) $(libraries)
,PHONY : clean


MAKE = make 

all: $(player)

$(player) $(libraries):
	$(MAKE) --print-directory --directory=$@

$(player) : $(libraries)
$(lib_ui) : $(lib_db) $(lib_codec)

clean: $(player) $(libraries)
	$(MAKE) --directory=$@ clean
