# scons Makefile

NM= scons
VRS= 3.1.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= 35b2a3993313bbedd221d4d5758fd2fd

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/env python/&3/' script/scons*
	python3 setup.py install	\
			--prefix=/usr	\
			--standard-lib	\
			--optimize=1	\
			--install-data=/usr/share
	rm -v /usr/bin/scons*.bat

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
