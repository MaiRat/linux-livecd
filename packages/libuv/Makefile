# libuv Makefile

NM= libuv
VRS= 1.31.0
DIR= $(NM)-v$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 54bf343151ee2ee2d3d4befc2ca4f840

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sh autogen.sh
	./configure --prefix=/usr --disable-static
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
