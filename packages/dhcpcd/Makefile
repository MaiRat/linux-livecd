# dhcpcd Makefile

NM= dhcpcd
VRS= 8.0.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/d/$(FILE)
MD5-$(FILE)= 182d506dd88773aec017d93a22d0f025

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure				\
		--libexecdir=/lib/dhcpcd	\
		--dbdir=/var/lib/dhcpcd
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
