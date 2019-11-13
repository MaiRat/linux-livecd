# URI Makefile

NM= URI
VRS= 1.74
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/perl-modules/$(FILE)
MD5-$(FILE)= 892f7183b178af40f205ba37128225db

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	perl Makefile.PL
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
