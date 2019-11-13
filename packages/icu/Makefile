# icu Makefile

NM= icu
VRS= 64.2
DIR= icu

FILE= icu4c-64_2-src.tgz
URL-$(FILE)= $(HTTP_BLFS)/i/$(FILE)
MD5-$(FILE)= a3d18213beec454e3cdec9a3116d6b05

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	cd source ; ./configure --prefix=/usr
	cd source ; make -j$(JOBS)
	cd source ; make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
