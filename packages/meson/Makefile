# meson Makefile

NM= meson
VRS= 0.51.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 48787e391ec5c052799a3dd491f73909

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	python3 setup.py build
	python3 setup.py install --root=dest
	cp -rv dest/* /

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
