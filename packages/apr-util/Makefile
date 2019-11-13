# apr-util Makefile

NM= apr-util
VRS= 1.6.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/a/$(FILE)
MD5-$(FILE)= 8ff5dc36fa39a2a3db1df196d3ed6086

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	\
		--prefix=/usr       \
		--with-apr=/usr     \
		--with-gdbm=/usr    \
		--with-openssl=/usr \
		--with-crypto
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
