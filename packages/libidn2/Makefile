# libidn2 Makefile

NM= libidn2
VRS= 2.2.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= b846d4d20e22b99d6f7387bb66e00a1f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --disable-static
	make 
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
