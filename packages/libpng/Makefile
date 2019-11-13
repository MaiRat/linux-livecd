# libpng Makefile

NM= libpng
VRS= 1.6.37
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 015e8e15db1eecde5f2eb9eb5b6e59e9

PATCH= $(DIR)-apng.patch.gz
URL-$(PATCH)= $(HTTP_BLFS)/l/$(PATCH)
MD5-$(PATCH)= f02073fd96816b184c79b297775e37dc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	gzip -cd ../libpng-1.6.37-apng.patch.gz | patch -p1
	./configure --prefix=/usr --disable-static
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
