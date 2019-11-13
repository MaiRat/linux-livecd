NM= Xorg-app
VRS= X11R7
URLBASE= https://www.x.org/pub/individual/app/

include $(MY_ROOT)/packages/$(NM)/filelist

ALLFILES= $(foreach FILE,$(sort $(filter FILE%,$(.VARIABLES))),$($(FILE)))

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(ALLFILES)
	$(foreach DIR,$(subst .tar.gz,,$(ALLFILES)),make FILE=$(DIR).tar.gz DIR=$(DIR) $(DIR)-stage2 && ) true


compile-%-stage2:
	case $(DIR) in \
		luit-[0-9]* ) \
			sed -i -e '/D_XOPEN/s/5/6/' configure \
		;; \
	esac
	./configure $(XORG_CONFIG)
	make -j$(JOBS)
	make install

%-stage2:
	$(std_build)

clean:
	rm -rf *-*/
