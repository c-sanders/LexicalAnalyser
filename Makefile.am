# Makefile.am for package : perceptron
# ==============================================================================
#
# Automake provides 3 '-I' options automatically and they are ;
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

# SUBDIRS         = images \
# 				  src \
#                   Toolboxes

# EXTRA_DIST      = ${top_srcdir}/include \
#                   ./dynamic_symbol_table.txt \
#                   ./utils


# Primaries
# ---------

bin_PROGRAMS           = simpleScanner

simpleScanner_SOURCES  = ./src/SimpleScanner.ll

simpleScanner_INCLUDES = -I${srcdir}/include

simpleScanner_CPPFLAGS = -DHAVE_CONFIG_H \
						 ${simulab_INCLUDES}

simpleScanner_LDFLAGS  = -lfl


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
	@echo "    - simulab-devel | s                                                         "
	@echo "    - doxygen | dox (defaults to doxygen-devel)                                 "
	@echo "    - doxygen-devel                                                             "
	@echo "    - doxygen-release                                                           "
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
	@echo "BASH          = ${SHELL}"
	@echo "SH            = ${SH}"
	@echo ""
	@echo "YACC          = ${YACC}"
	@echo ""
	@echo "top_srcdir    = ${top_srcdir}"
	@echo "srcdir        = ${srcdir}"
	@echo ""
	@echo "builddir      = ${builddir}"
	@echo "abs_builddir  = ${abs_builddir}"
	@echo "top_builddir  = ${top_builddir}"
