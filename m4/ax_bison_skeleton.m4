# -----------------------------------------------------------------------------
# Macro : AX_BISON_SKELETON
# =========================
#
# This macro can be used to tell the GNU Autotools which Skeleton file GNU
# Bison should use.
#
#
# -----------------------------------------------------------------------------


AC_DEFUN(

  [AX_BISON_SKELETON],

  [
	AC_ARG_WITH(
	  [bison-skeleton],
	  [
AS_HELP_STRING(
[--with-bison-skeleton=@<:@bison-skeleton@:>@],
[instruct GNU Bison which Skeleton file to use (ARG=bison_skeleton)]
)
	  ],
	  [BISON_SKELETON=${withval}],
	  [BISON_SKELETON=$1]
	)
	AS_CASE(
	  [${withval}],
	  [yes], [BISON_SKELETON=$1],
	  [no],  [BISON_SKELETON=$1],
	  [BISON_SKELETON="${withval}"]
	)

AC_SUBST(BISON_SKELETON)
  ]
)