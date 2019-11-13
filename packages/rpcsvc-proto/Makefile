# rpcsvc-proto Makefile

NM= rpcsvc-proto
VRS= 1.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/r/$(FILE)
MD5-$(FILE)= 3b2724bb7d6560ddcb4dbcdb5465de10

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./autogen.sh
	./configure --sysconfdir=/etc
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
