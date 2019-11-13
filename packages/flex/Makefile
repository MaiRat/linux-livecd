# Flex Makefile

NM= flex
VRS= 2.6.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 2882e3179748cc9f9c23ec593d6adc8d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i "/math.h/a #include <malloc.h>" src/flexdef.h
	HELP2MAN=/tools/bin/true	\
	./configure 			\
		--prefix=/usr		\
		--docdir=/usr/share/doc/flex-2.6.4
	make -j$(JOBS)
	make install
	ln -sv flex /usr/bin/lex

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
