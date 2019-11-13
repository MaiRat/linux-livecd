# Mako Makefile

NM= Mako
VRS= 1.1.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/python-modules/$(FILE)
MD5-$(FILE)= 6c3f2da0b74af529a4c4a537d0848bf2

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	python3 setup.py install --optimize=1

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
