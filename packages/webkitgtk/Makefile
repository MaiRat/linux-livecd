# webkitgtk Makefile

NM= webkitgtk
VRS= 2.24.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/w/$(FILE)
MD5-$(FILE)= c214963d8c0e7d83460da04a0d8dda87

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	CFLAGS=-Wno-expansion-to-defined	\
	CXXFLAGS=-Wno-expansion-to-defined	\
	cmake	-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_SKIP_RPATH=ON		\
		-DPORT=GTK			\
		-DLIB_INSTALL_DIR=/usr/lib	\
		-DUSE_LIBHYPHEN=OFF		\
		-DUSE_LIBNOTIFY=OFF		\
		-DENABLE_MINIBROWSER=ON		\
		-DENABLE_INTROSPECTION=OFF	\
		-DUSE_WOFF2=OFF			\
		-DENABLE_GEOLOCATION=OFF	\
		-DENABLE_SPELLCHECK=OFF		\
		-Wno-dev -G Ninja ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
