# xfce Makefile
NM= xfce
VRS= 4.14.1
URLBASE= $(HTTP_BLFS)

include $(MY_ROOT)/packages/$(NM)/filelist

ALLFILES= $(foreach FILE,$(sort $(filter FILE%,$(.VARIABLES))),$($(FILE)))

BG= lfsrules-1600-1200.jpg
URL-$(BG)= http://www.linuxfromscratch.org/blfs/artwork/wallpapers/$(BG)
MD5-$(BG)= b0ebba7de2b9dfaf5540ddf8babccdd5

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(ALLFILES) $(BG)
	$(foreach DIR,$(subst .tar.bz2,,$(ALLFILES)),make FILE=$(DIR).tar.bz2 DIR=$(DIR) $(DIR)-stage2 && ) true
	cp $(MY_ROOT)/root/.xinitrc /etc/X11/xinit/xinitrc
	install -dv /usr/share/applications
	cp desktop_files/* /usr/share/applications
	install -D -m644 helpers.rc /etc/xdg/xfce4/helpers.rc
	install -D -m644 terminalrc /etc/xdg/Terminal/terminalrc
	mkdir -p /etc/xdg/xfce4/mcs_settings
	cp settings/* /etc/xdg/xfce4/mcs_settings
	install -dv /usr/share/xfce4/backdrops/
	cp $(BG) /usr/share/xfce4/backdrops/
	
compile-%-stage2:
	 ./configure \
	 	--prefix=/usr --enable-gtk3
	make -j$(JOBS)
	make install


%-stage2:
	$(std_build)

clean:
	rm -rf *-*/

