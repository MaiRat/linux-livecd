NM= livecd-bootscripts
VRS= SVN

# Targets

SCRIPTS= clkconf langconf brltty brltty-restart speakup speakup-restart
DATA= font.dat font-errors.dat lang.dat

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(SCRIPTS) $(DATA)
	@$(call echo_message, Building)
	@make -f Makefile compile-$@ >>$(NM)-$@.log 2>&1
	@touch $@

compile-stage2:
	install -d -m755 /etc/langconf
	install -m754 $(SCRIPTS) /etc/rc.d/init.d
	install -d -m754 /etc/rc.d/rcsysinit.d
	install -m644 $(DATA) /etc/langconf
	#ln -sf ../init.d/brltty /etc/rc.d/rcS.d/S12brltty
	#ln -sf ../init.d/speakup /etc/rc.d/rcS.d/S12speakup
	ln -sf ../init.d/clkconf /etc/rc.d/rcS.d/S59clkconf
	ln -sf ../init.d/langconf /etc/rc.d/rcS.d/S69langconf
	# brltty has to be restarted in order to see the font change
	# and speakup has to react to the language change
	#ln -sf ../init.d/brltty-restart /etc/rc.d/rcS.d/S71brltty-restart
	#ln -sf ../init.d/speakup-restart /etc/rc.d/rcS.d/S71speakup-restart
	#ln -sf ../init.d/devmount /etc/rc.d/rcS.d/S00devmount


clean:

.PHONY: clean compile-stage2
