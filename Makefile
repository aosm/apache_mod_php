##
# Makefile for php
##

# Project info
Project               = php
UserType              = Administration
ToolType              = Services
Extra_Configure_Flags = --with-apxs
Extra_Environment     = AR="$(SRCROOT)/ar.sh" PEAR_INSTALLDIR="$(NSLIBRARYDIR)/PHP"
GnuAfterInstall       = strip mode

Framework = $(NSFRAMEWORKDIR)/php.framework/Versions/4

# It's a GNU Source project
Extra_CC_Flags = -no-cpp-precomp
include $(MAKEFILEPATH)/CoreOS/ReleaseControl/GNUSource.make
Extra_CC_Flags = -no-cpp-precomp

Install_Target = install

Install_Flags = INSTALL_ROOT=$(DSTROOT)

strip:
	$(_v) $(STRIP) -S "$(DSTROOT)`apxs -q LIBEXECDIR`/"*.so

mode:
	$(_v) $(CHMOD) -R ugo-w "$(DSTROOT)"
