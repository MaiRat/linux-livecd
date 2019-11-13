# libaio Makefile

NM= libaio
VRS= 0.3.112
DIR= $(NM)-$(VRS)

FILE= $(NM)_$(VRS).orig.tar.xz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 66e3b7dd255581a73542ee851f8cd737

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	sed -i '/install.*libaio.a/s/^/#/' src/Makefile
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
