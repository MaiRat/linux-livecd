# UnZip Makefile

NM= unzip
VRS= 60
DIR= $(NM)$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/u/$(FILE)
MD5-$(FILE)= 62b490407489521db863b523a7f86375

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make -f unix/Makefile generic
	make -f unix/Makefile prefix=/usr MANDIR=/usr/share/man/man1 install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
