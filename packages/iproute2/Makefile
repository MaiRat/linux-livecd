# Iproute2 Makefile

NM= iproute2
VRS= 5.2.0
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 0cb2736e7bc2f56254a363d3d23703b7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build) 

compile-stage2:
	sed -i /ARPD/d Makefile
	rm -fv man/man8/arpd.8
	sed -i 's/.m_ipt.o//' tc/Makefile
	make -j$(JOBS)
	make DOCDIR=/usr/share/doc/$(DIR) install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
