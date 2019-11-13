# Expat Makefile

NM= expat
VRS= 2.2.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 3659bc0938db78815b5f5a9c24d732aa

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) 
	$(std_build)

compile-stage2:
	sed -i 's|usr/bin/env |bin/|' run.sh.in
	./configure			\
		--prefix=/usr		\
		--disable-static	\
		--docdir=/usr/share/doc/expat-2.2.7
	make -j$(JOBS)
	make install
	install -v -m755 -d /usr/share/doc/$(DIR)
	install -v -m644 doc/*.{html,png,css} /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
