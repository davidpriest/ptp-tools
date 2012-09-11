# DOCUMENTATION REPOSITORY

This repository contains a complete publishing system for the OS X platform.

# CONFIGURATION

In mksupport/fop.conf, adjust the path in line 4:

  <font-base>PATH/TO/tools/mksupport/fonts/</font-base>

In the document packages, adjust the path in the first line of mk_bash.sh and
mk_win.bat:

  export DOCTOOLS=~/PATH/TO/tools

OR

  set DOCTOOLS=C:\PATH\TO\tools
