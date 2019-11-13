# graphite2 Makefile

NM= graphite2
VRS= 1.3.13
DIR= $(NM)-$(VRS)

FILE= $(DIR).tgz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= 29616d4f9651706036ca25c111508272

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; sed -i '/cmptest/d' tests/CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../$(DIR)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
