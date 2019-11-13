# intltool Makefile

NM= intltool
VRS= 0.51.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 12e517cac2b57a0121cda351570f1e63

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's:\\\$${:\\\$$\\{:' intltool-update.in
	./configure	\
		--prefix=/usr
	make -j$(JOBS)
	make install
	install -v -m644 -D doc/I18N-HOWTO /usr/share/doc/$(DIR)/I18N-HOWTO

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
