# Curl Makefile

NM= curl
VRS= 7.65.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/c/$(FILE)
MD5-$(FILE)= 7bd5b2ebfd3f591034eb8b55314d8c02

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --disable-static --enable-thread-resolver --with-ca-path=/etc/ssl/certs
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
