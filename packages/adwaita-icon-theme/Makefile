# adwaita-icon-theme Makefile

NM= adwaita-icon-theme
VRS= 3.32.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/a/$(FILE)
MD5-$(FILE)= 4b16278cfed860a86c8221de62eec151

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
