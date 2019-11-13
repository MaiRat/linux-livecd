# nettle Makefile

NM= nettle
VRS= 3.5.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/n/$(FILE)
MD5-$(FILE)= 0e5707b418c3826768d41130fbe4ee86

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --disable-static
	make -j$(JOBS)
	make install
	chmod -v 755 /usr/lib/lib{hogweed,nettle}.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
