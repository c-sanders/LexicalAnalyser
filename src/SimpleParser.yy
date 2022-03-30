%skeleton "lalr1.cc"
%require  "3.0"


%{
    /*
     * This is the prologue section. This code goes on the top of the parser implementation file.
     */

#include <iostream>


using std::cout;
using std::endl;


/*
 * The function yylex is sometimes referred to as a Lexical Scanner.
 *
 * According to the GNU Bison manual, the value that yylex returns must be the positive numeric code
 * for the type/kind of token it has just found. A zero or negative value signifies end-of-input.
 *
 * yylex is defined in SimpleScanner.cpp
 *
 * yylex does NOT seem to get declared by GNU Flex into any header file.
 */

extern
int
yylex
(
 void
);
/*
{
    yyFlexLexer::yylex();

    return(0);
}
 */

extern
int
yyerror
(
 char const *
);


%}

    /*
     * Declarations of terminals.
     */

%token  UUID
        COMMAND_CONNECT
        COMMAND_DISCONNECT
        COMMAND_EXIT
        COMMAND_QUIT
        COMMAND_HELP
        VARIABLE
        COMMAND_ECHO_UUID
        COMMAND_CREATE_NODE
        LPAREN
        RPAREN;

%%

    /*
     * Grammar rules.
     */

assignment : COMMAND_CREATE_NODE LPAREN RPAREN ';'
    {
        cout << "Have encountered : Assignment" << endl;
    };
