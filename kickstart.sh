#bash/sh
#davidpriest.ca
#Generate the Unix ptp-tools installer
#

shopt -s extglob
if [ -e ./ptp/quine ] ; then
  # Build ptp-tools
  cd ptp
  ./tangle.sh ./quine/_ptp-tools.txt
  # Remove old open-source tools
  cd ..
  if [ -e ./ptp/quine ] ; then
    rm -r -- !(ptp*)
  fi
  # Install ptp-tools root-level components
  cd ptp/output
  chmod u+x *.sh
  cp -f CATALOG.XML init-fop.xsl init.sh kickstart.sh install.sh README.MD ../..
  # Install open-source tools
  cd ../..
  ./install.sh
else
  echo "This does not appear to be the ptp-tools directory!"
  echo "Destructive operation cancelled."
fi