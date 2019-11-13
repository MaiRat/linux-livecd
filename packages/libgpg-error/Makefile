# libgpg-error Makefile

NM= libgpg-error
VRS= 1.36
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= eff437f397e858a9127b76c0d87fa5ed

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/namespace/pkg_&/' src/Makefile.{am,in} src/mkstrtable.awk
	./configure --prefix=/usr
	make -j$(JOBS)
	make install
	install -v -m644 -D README /usr/share/doc/$(DIR)/README

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
