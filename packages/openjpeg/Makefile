# openjpeg Makefile

NM= openjpeg
VRS= 2.3.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/o/$(FILE)
MD5-$(FILE)= 3b9941dc7a52f0376694adb15a72903f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	cmake	-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DBUILD_STATIC_LIBS=OFF ../$(DIR)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
