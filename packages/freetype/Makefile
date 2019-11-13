# FreeType Makefile

NM= freetype
VRS= 2.10.1
DIR= $(NM)-$(VRS)
	 
FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/f/$(FILE)
MD5-$(FILE)= bd42e75127f8431923679480efb5ba8f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE2)
	$(std_build)

compile-stage2:
	sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
	sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
	    -i include/freetype/config/ftoption.h
	./configure --prefix=/usr --enable-freetype-config --disable-static --without-harfbuzz
	make -j$(JOBS)
	make install

stage3: Makefile $(FILE) $(FILE2)
	$(std_build)

compile-stage3:
	sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
	sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
	    -i include/freetype/config/ftoption.h
	./configure --prefix=/usr --enable-freetype-config --disable-static
	make -j$(JOBS)
	make install


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2 compile-stage3
