#bash/sh
#Generate the Unix ptp-tools installer
#

shopt -s extglob
if [ -e ./ptp/kickstart ] ; then
  # Remove old tools
  rm -r -- !(ptp*|kickstart.sh)
  # Build scripts
  cd ptp
  ./weave.sh ./quine/_ptp-tools.txt
  # Move to kickstart, make executable
  cp output/*[!_ptp-tools.xml] kickstart
  chmod u+x kickstart/*.sh
  # return to ptp-tools directory, install installer
  cd ..
  cp ptp/kickstart/install.sh .
  # replace old kickstarter
  cp ptp/kickstart/kickstart.sh .
else
  echo "This does not appear to be the ptp-tools directory!"
  echo "Destructive operation cancelled."
fi