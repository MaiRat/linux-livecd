# gstreamer Makefile

NM= gstreamer
VRS= 1.16.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= 862b7e4263d946bc2ef31b3c582e5587

PATCH= $(DIR)-buffer_size_reset_fix-1.patch
URL-$(PATCH)= $(HTTP_BLFS)/g/$(PATCH)
MD5-$(PATCH)= 862b7e4263d946bc2ef31b3c582e5587


# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; patch -Np1 -i ../$(PATCH)
	meson	--prefix=/usr							\
		-Dbuildtype=release						\
		-Dgst_debug=false						\
		-Dgtk_doc=disabled						\
		-Dpackage-origin=http://www.linuxfromscratch.org/blfs/view/svn/	\
		-Dpackage-name="GStreamer 1.16.0 BLFS" ../$(DIR)
	ninja
	ninja install


clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
