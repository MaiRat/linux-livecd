# iptables Makefile

NM= iptables
VRS= 1.8.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/i/$(FILE)
MD5-$(FILE)= 29de711d15c040c402cf3038c69ff513

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--sbindir=/sbin		\
		--disable-nftables	\
		--enable-libipq		\
		--with-xtlibdir=/lib/xtables
	make -j$(JOBS)
	make install
	ln -sfv ../../sbin/xtables-legacy-multi /usr/bin/iptables-xml
	for file in ip4tc ip6tc ipq iptc xtables; do \
		mv -v /usr/lib/lib$${file}.so.* /lib ;	\
		ln -sfv ../../lib/$$(readlink /usr/lib/lib$${file}.so) /usr/lib/lib$${file}.so ; \
	done

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
