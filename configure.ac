# ------------------------------------------------------------------------------
# Filename : configure.ac
# =======================
#
# Process this file with autoconf to produce a configure script.
# ------------------------------------------------------------------------------


# AC_INIT(
#		[Simple Scanner generated using GNU Flex],
#		[0.0.1],
#		[support@gravitas.com],
#		[SimpleScanner],
#		[http://www.gravitas-toolworks.com])

AC_INIT(
        [SimpleScanner],
		[0.0.1])

AC_CONFIG_SRCDIR([src/SimpleScanner.ll])

AC_CONFIG_AUX_DIR(config)

AM_INIT_AUTOMAKE([subdir-objects])

AC_CONFIG_MACRO_DIR([m4])

AC_PROG_CC

AC_PROG_CXX(
			[${CXX}]
		   )

AM_PROG_LEX

# AC_PROG_YACC

AC_PROG_LIBTOOL

LT_INIT([preserve-dup-deps])

AC_OUTPUT([
           Makefile
		   src/Makefile
])
