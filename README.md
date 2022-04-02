Filename : README
*****************


1) Introduction
---------------

This package implements a basic Lexical Analyser (aka Lexer, Scanner, or Tokeniser). The bulk of the
Lexical Analyser is implemented in the C programming language by the Flex utility, whilst the
rest of it is implemented using the C++ programming language.

Don't let the above description confuse you! It doesn't mean that the Lexical Analyser can only be
used to recognise C and/or C++ source code. It means only what it says - and that is that the
Lexical Analyser was implemented using the C and C++ programming languages.

A point that is worth noting about the package that implements the Flex utility, is that it is not
actually a GNU package. As a result, you will not be able to find information about it on the GNU
website. Instead, information about the package can be found at;

  https://github.com/westes/flex


2) How to process this package
------------------------------

This package is designed to be processed by the GNU Autotools suite of tools, and the remainder of
this file will explain how to do just that. Processing the package in the manner described below,
will cause it to become a GNU Autotools project.

To begin the process of turning this package into a GNU Autotools project, cd to the directory
which contains this file, and then execute the following two commands from within it ;

  - libtoolize
  - autoreconf

The autoreconf command may complain that a number of required files cannot be found. However,
don't worry about this, because the autoreconf command also informs us that this problem can be
rectified by executing the command ;

  - automake --add-missing

Execute this command, and if it is successful, then execute the autoreconf command one more time.

If all of these commands executed successfully, then the package should now be setup as a GNU
Autotools project. If this is indeed the case, then a file called configure should have been created
in the same directory as this file.


3) What to do next
------------------

Read the INSTALL file for instructions on how to use this configure script. It will explain how to
configure, build, and then install the Lexical Analyser and any of its associated files.

Invoking this package's configure script with the --help option, will display the list of options
options which are available for this script. Doing this should result in the following;
```
001 `configure' configures SimpleScanner 0.0.1 to adapt to many kinds of systems.
002
003 Usage: /home/craig/source_code/GitHub/LexicalAnalyser_new/configure [OPTION]... [VAR=VALUE]...
004
005 To assign environment variables (e.g., CC, CFLAGS...), specify them as
006 VAR=VALUE.  See below for descriptions of some of the useful variables.
007
008 Defaults for the options are specified in brackets.
009
010 Configuration:
011   -h, --help              display this help and exit
012       --help=short        display options specific to this package
013       --help=recursive    display the short help of all the included packages
014   -V, --version           display version information and exit
015   -q, --quiet, --silent   do not print `checking ...' messages
016       --cache-file=FILE   cache test results in FILE [disabled]
017   -C, --config-cache      alias for `--cache-file=config.cache'
018   -n, --no-create         do not create output files
019       --srcdir=DIR        find the sources in DIR [configure dir or `..']
020
021 Installation directories:
022   --prefix=PREFIX         install architecture-independent files in PREFIX
023                           [/usr/local]
024   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
025                           [PREFIX]
026
027 By default, `make install' will install all the files in
028 `/usr/local/bin', `/usr/local/lib' etc.  You can specify
029 an installation prefix other than `/usr/local' using `--prefix',
030 for instance `--prefix=$HOME'.
031
032 For better control, use the options below.
033
034 Fine tuning of the installation directories:
035   --bindir=DIR            user executables [EPREFIX/bin]
036   --sbindir=DIR           system admin executables [EPREFIX/sbin]
037   --libexecdir=DIR        program executables [EPREFIX/libexec]
038   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
039   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
040   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
041   --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
042   --libdir=DIR            object code libraries [EPREFIX/lib]
043   --includedir=DIR        C header files [PREFIX/include]
044   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
045   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
046   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
047   --infodir=DIR           info documentation [DATAROOTDIR/info]
048   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
049   --mandir=DIR            man documentation [DATAROOTDIR/man]
050   --docdir=DIR            documentation root [DATAROOTDIR/doc/simplescanner]
051   --htmldir=DIR           html documentation [DOCDIR]
052   --dvidir=DIR            dvi documentation [DOCDIR]
053   --pdfdir=DIR            pdf documentation [DOCDIR]
054   --psdir=DIR             ps documentation [DOCDIR]
055
056 Program names:
057   --program-prefix=PREFIX            prepend PREFIX to installed program names
058   --program-suffix=SUFFIX            append SUFFIX to installed program names
059   --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
060
061 System types:
062   --build=BUILD     configure for building on BUILD [guessed]
063   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
064
065 Optional Features:
066   --disable-option-checking  ignore unrecognized --enable/--with options
067   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
068   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
069   --enable-silent-rules   less verbose build output (undo: "make V=1")
070   --disable-silent-rules  verbose build output (undo: "make V=0")
071   --enable-dependency-tracking
072                           do not reject slow dependency extractors
073   --disable-dependency-tracking
074                           speeds up one-time build
075   --enable-shared[=PKGS]  build shared libraries [default=yes]
076   --enable-static[=PKGS]  build static libraries [default=yes]
077   --enable-fast-install[=PKGS]
078                           optimize for fast installation [default=yes]
079   --disable-libtool-lock  avoid locking (might break parallel builds)
080
081 Optional Packages:
082   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
083   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
084   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
085                           both]
086   --with-aix-soname=aix|svr4|both
087                           shared library versioning (aka "SONAME") variant to
088                           provide on AIX, [default=aix].
089   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
090   --with-sysroot[=DIR]    Search for dependent libraries within DIR (or the
091                           compiler's sysroot if not specified).
092
093 Some influential environment variables:
094   CC          C compiler command
095   CFLAGS      C compiler flags
096   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
097               nonstandard directory <lib dir>
098   LIBS        libraries to pass to the linker, e.g. -l<library>
099   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
100               you have headers in a nonstandard directory <include dir>
101   CXX         C++ compiler command
102   CXXFLAGS    C++ compiler flags
103   YACC        The `Yet Another Compiler Compiler' implementation to use.
104               Defaults to the first program found out of: `bison -y', `byacc',
105               `yacc'.
106   YFLAGS      The list of arguments that will be passed by default to $YACC.
107               This script will default YFLAGS to the empty string to avoid a
108               default value of `-d' given by some make applications.
109   LT_SYS_LIBRARY_PATH
110               User-defined run-time library search path.
111   CPP         C preprocessor
112   CXXCPP      C++ preprocessor
113
114 Use these variables to override the choices made by `configure' or to help
115 it to find libraries and programs with nonstandard names/locations.
116
117 Report bugs to the package provider.
```

Of all the information that can be passed to this configure script, there are two pieces of
information in particular that the configure script needs to know about.

  1) where it can find the Flex package, and
  2) where it can find the GNU Bison package.

Having stated this however, it is worth noting that this configure script doesn't provide options
for detecting either the Flex package or the GNU Bison package. That is, it doesn't provide options
which are anything like the following;

  - --with-flex[=ARG]
  - --with-bison[=ARG]

Thus, in order to specify the location for both of these two packages, environment variables will
need to be used instead, as was hinted at above. An example of how to do this is shown below;

    LEX=/home/craig/local/flex-2.6.4/bin/flex \
    BISON=/home/craig/local/bison-3.8/bin/bison \
    ./configure --disable-dependency-tracking \
                --prefix=/home/craig/local/LexicalAnalyser_new \
                --exec-prefix=/home/craig/local/LexicalAnalyser_new

Note that the first two lines of the


