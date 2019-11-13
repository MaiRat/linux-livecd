# serf Makefile

NM= serf
VRS= 1.3.9
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= 370a6340ff20366ab088012cd13f2b57

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i "/Append/s:RPATH=libdir,::"		SConstruct
	sed -i "/Default/s:lib_static,::"		SConstruct
	sed -i "/Alias/s:install_static,::"		SConstruct
	sed -i "/  print/{s/print/print(/; s/$$/)/}"	SConstruct
	sed -i "/get_contents()/s/,/.decode()&/"	SConstruct
	scons PREFIX=/usr
	scons PREFIX=/usr install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
