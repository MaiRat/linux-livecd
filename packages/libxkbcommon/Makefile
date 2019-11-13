# libxkbcommon Makefile

NM= libxkbcommon
VRS= 0.8.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 3c4409058dfd203f641a563358e0187d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure		\
		$(XORG_CONFIG)	\
		--docdir=/usr/share/doc/libxkbcommon-0.8.4
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
