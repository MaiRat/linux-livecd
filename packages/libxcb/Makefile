# libxcb Makefile

NM= libxcb
VRS= 1.13.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= f33cdfc67346f7217a9326c0d8679975

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i "s/pthread-stubs//" configure
	./configure			\
		$(XORG_CONFIG)		\
		--without-doxygen	\
		--docdir='$${datadir}'/doc/libxcb-1.13.1
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
