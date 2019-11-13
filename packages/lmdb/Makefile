# lmdb Makefile

NM= lmdb
VRS= 0.9.24
DIR= $(NM)-LMDB_$(VRS)

FILE= LMDB_$(VRS).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= c3e3474daf4a59685d154cc7fc5c99ad

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd libraries/liblmdb ; make
	cd libraries/liblmdb ; sed -i 's| liblmdb.a||' Makefile
	cd libraries/liblmdb ; make prefix=/usr install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
