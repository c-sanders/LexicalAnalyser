# Makefile.am for package : simpleLexicalAnalyser
# ==============================================================================
#
# GNU Automake automatically provides three '-I' options, and they are ;
#
#   -I.
#   -I${srcdir}
#   -I which points to the directory holding 'config.h'
#
# The last '-I' option will be provided if AC_CONFIG_HEADERS or 
# AM_CONFIG_HEADERS is called within the configure.ac file.
#
# You can disable the default '-I' options using the 'nostdinc' option. - Page
# 68 of Automake version 1.10 manual.
# ------------------------------------------------------------------------------

ACLOCAL_AMFLAGS = -I m4


vpath %.l   ${srcdir}
vpath %.ll  ${srcdir}

vpath %.y   ${srcdir}
vpath %.yy  ${srcdir}


# Primaries
# ---------

bin_PROGRAMS                   = simpleScannerC \
                                 simpleScannerCpp \
                                 simpleParser


all : simpleParser


# ================================================================================
# Target 1) - simpleScannerC
# ================================================================================
#
#   > make simpleScanner
#
# will make this target. Note that the target name is in lower camel case.
#
# This target will;
#
#   - Instruct flex to generate a Scanner which is implemented in C.
#   - Instruct the C Compiler to compile the Scanner and the Scanner driver.
#   - Link all of the compiled files together to produce a binary executable.
#
# Notes :
# -------
#
# - Just because the Scanner is implemented in C by flex, it doesn't mean that the
#   Scanner driver needs to be as well.
#
# ================================================================================

simpleScannerC_SOURCES  = main.cpp \
                          SimpleParser.tab.c \
                          SimpleScanner.c

simpleScannerC_INCLUDES = -I${srcdir}/include \
                          -I/home/craig/local/flex-2.6.4/include

simpleScannerC_CPPFLAGS = -DHAVE_CONFIG_H \
                          ${simpleScanner_INCLUDES}

simpleScannerC_LDFLAGS  = -lfl

simpleScannerC_LEXFLAGS = --verbose --header-file=SimpleScannerC.h


SimpleScanner.c : SimpleScanner.l

	${LEX} ${simpleScannerC_LEXFLAGS} --outfile=${@} ${<}


# ================================================================================
# Target 2) simpleScannerCpp
# ================================================================================
#
#   > make simpleScannerCpp
#
# will make this target. Note that the target name is in lower camel case.
#
# This target will;
#
#   - Instruct flex to generate a Scanner which is implemented in C++.
#   - Instruct the C++ Compiler to compile the Scanner and the Scanner driver.
#   - Link all of the compiled files together to produce a binary executable.
#
# ================================================================================

simpleScannerCpp_SOURCES  = main.cpp \
                            SimpleScanner.cpp

simpleScannerCpp_INCLUDES = -I${srcdir}/include \
                            -I/home/craig/local/flex-2.6.4/include

simpleScannerCpp_CPPFLAGS = -DHAVE_CONFIG_H \
                            ${simpleScannerCpp_INCLUDES}

simpleScannerCpp_LDFLAGS  = -lfl


SimpleScanner.cpp : SimpleScanner.l

	${LEX} --verbose --c++ --prefix=Monty --header-file=SimpleScanner.hpp --outfile=${@} ${<}


# ================================================================================
# Target 3) simpleParser
# ================================================================================
#
#   > make simpleParser
#
# will make this target. Note that the target name is in lower camel case.
#
# This target should build a Parser which is implemented in C.
# ================================================================================

simpleParser_SOURCES   = main.c \
                         SimpleScanner.c \
                         SimpleParser.tab.c

simpleParser_INCLUDES  = -I${srcdir}/include \
                         -I${FLEX_ROOTDIR}/include \
                         -I${BISON_ROOTDIR}/include

simpleParser_CPPFLAGS  = -DHAVE_CONFIG_H \
                         ${simpleParser_INCLUDES}

simpleParser_LDFLAGS   = -lfl


SimpleParser.tab.c : SimpleParser.y

	${YACC} --verbose --language=c --defines="SimpleParser.tab.h" ${<}


dummy : SimpleScanner.l

	echo "${@}"
	echo "${<}"
	echo "${#}"


# Executable target : help
# ------------------------

h    : help
help :
	@echo "                                                                                "
	@echo "This Makefile contains a number of targets and these targets can be divided up  "
	@echo "into two categories; 1) Build based targets, or 2) Ancilliary targets.          "
	@echo "                                                                                "
	@echo "  1) Build based targets                                                        "
	@echo "                                                                                "
	@echo "    - simpleScanner                                                             "
	@echo "                                                                                "
	@echo "  2) Ancilliary targets                                                         "
	@echo "                                                                                "
	@echo "    - clean | c                                                                 "
	@echo "    - archive | a                                                               "
	@echo "    - tar (defaults to tar, i.e. Tape ARchive)                                  "
	@echo "    - help | h                                                                  "
	@echo "    - reset | r                                                                 "
	@echo "    - test                                                                      "
	@echo "    - packageChecker | p                                                        "
	@echo "                                                                                "


# Miscellaneous executable targets
# --------------------------------

.PHONY : displaySettings
displaySettings :
	@echo "BASH           = ${SHELL}"
	@echo "SH             = ${SH}"
	@echo ""
	@echo "LEX            = ${LEX}"
	@echo "FLEX           = ${FLEX}"
	@echo ""
	@echo "YACC           = ${YACC}"
	@echo "BISON          = ${BISON}"
	@echo ""
	@echo "FLEX_ROOTDIR   = ${FLEX_ROOTDIR}"
	@echo "BISON_ROOTDIR  = ${BISON_ROOTDIR}"
	@echo ""
	@echo "BISON_SKELETON = ${BISON_SKELETON}"
	@echo ""
	@echo "top_srcdir     = ${top_srcdir}"
	@echo "srcdir         = ${srcdir}"
	@echo ""
	@echo "builddir       = ${builddir}"
	@echo "abs_builddir   = ${abs_builddir}"
	@echo "top_builddir   = ${top_builddir}"
	@echo ""
	@echo "simpleParser_INCLUDES = ${simpleParser_INCLUDES}"
	@echo "simpleParser_CPPFLAGS = ${simpleParser_CPPFLAGS}"

