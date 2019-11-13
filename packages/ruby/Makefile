# ruby Makefile

NM= ruby
VRS= 2.6.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/r/$(FILE)
MD5-$(FILE)= 624ecd14d366b20f41db35f06337d007

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --enable-shared --disable-install-doc --disable-install-rdoc --disable-install-capi
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
