# libjpeg-turbo Makefile

NM= libjpeg-turbo
VRS= 2.0.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 79f76fbfb0c6109631332762d10e16d2

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=RELEASE  \
	      -DENABLE_STATIC=FALSE       \
	      -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo-2.0.2 \
	      -DCMAKE_INSTALL_DEFAULT_LIBDIR=lib  \
		../$(DIR)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
