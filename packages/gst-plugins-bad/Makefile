# gst-plugins-bad Makefile

NM= gst-plugins-bad
VRS= 1.16.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= e9e562d86c1527c44d904500dd35e326

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson	--prefix=/usr							\
		-Dbuildtype=release						\
		-Dgtk_doc=disabled						\
		-Dpackage-origin=http://www.linuxfromscratch.org/blfs/view/svn/	\
		-Dpackage-name="GStreamer 1.16.0 BLFS" ../$(DIR)
	ninja
	ninja install


clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
