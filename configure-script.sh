#! /bin/bash

# Set the values of some important variables.

SRC_DIR="/home/craig/source_code/GitHub/LexicalAnalyser_new/"
INSTALL_DIR="/home/craig/local/LexicalAnalyser_new/"

FLEX="/home/craig/local/flex-2.6.4/bin/flex"
BISON="/home/craig/local/bison-3.8/bin/bison"

SKELETON_FILE="glr.c"


echo "================================================================================"
echo ""
echo "Running file : configure_script.sh"
echo ""
echo "================================================================================"
echo "Please check that the following variables set correctly."
echo "--------------------------------------------------------"
echo ""
echo "SRC_DIR     = ${SRC_DIR}"
echo "INSTALL_DIR = ${INSTALL_DIR}"
echo ""
echo "FLEX        = ${FLEX}"
echo "BISON       = ${BISON}"
echo "================================================================================"
echo ""
echo "Are these values correct?"
echo ""

read -p "Press 'Y' if yes, any other key otherwise > " response

if [ -z ${response} ]
then

  response="n"

fi

if [ ${response} = 'y' ] || [ ${response} = 'Y' ]
then

  # Invoke the configure script.

  LEX=${FLEX} \
  YACC=${BISON} \
  ${SRC_DIR}configure \
  --prefix=${INSTALL_DIR} \
  --exec-prefix=${INSTALL_DIR} \
  --with-bison-skeleton="${SKELETON_FILE}"

else

  echo "Exiting prematurely from script. Goodbye!"

fi

exit 0