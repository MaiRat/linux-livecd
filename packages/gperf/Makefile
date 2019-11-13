# gperf Makefile

NM= gperf
VRS= 3.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 9e251c0a618ad0824b51117d5d9db87e

# Targets

include $(MY_ROOT)/scripts/functions


stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure		\
		--prefix=/usr	\
		--docdir=/usr/share/doc/gperf-$(VRS)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
