# Grep Makefile

NM= grep
VRS= 3.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 05d0718a1b7cc706a4bdf8115363f1ed

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure	\
		--prefix=$(TT)
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure		\
		--prefix=/usr	\
		--bindir=/bin
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
