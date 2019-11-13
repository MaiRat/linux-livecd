# sqlite Makefile

NM= sqlite
VRS= 3290000
DIR= $(NM)-autoconf-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= 8f3dfe83387e62ecb91c7c5c09c688dc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	--prefix=/usr     			\
			--disable-static  			\
			--enable-fts5     			\
			CFLAGS="-g -O2				\
			-DSQLITE_ENABLE_FTS3=1			\
			-DSQLITE_ENABLE_FTS4=1			\
			-DSQLITE_ENABLE_COLUMN_METADATA=1	\
			-DSQLITE_ENABLE_UNLOCK_NOTIFY=1		\
			-DSQLITE_ENABLE_DBSTAT_VTAB=1		\
			-DSQLITE_SECURE_DELETE=1		\
			-DSQLITE_ENABLE_FTS3_TOKENIZER=1"
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
