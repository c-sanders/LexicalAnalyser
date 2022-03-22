/*
 * The GNU Flex program should be used to process this file.
 *
 * The code in this file implements a Scanner using the C++ programming language. As a consequence,
 * it should be processed accordingly. The following points should be taken into account when using
 * one of the GNU Flex tools, i.e. flex or flex++, to process this file.
 *
 *   - Use any one of the following commands to process this file;
 *
 *       > flex   --verbose       ./SimpleScanner.ll
 *       > flex   --verbose --c++ ./SimpleScanner.ll
 *       > flex++ --verbose       ./SimpleScanner.ll
 *
 * Note 1) : If the first incarnation of the command is used, then you may also need to specify the
 *           following option below;
 *
 *             %option c++
 *
 * Note 2) : The first incarnation of the command can also be used to process this file, if the code
 *           in this file implements a Scanner using the C programming language.
 *
 * Note 3) : The flex++ version of the GNU Flex program should be used
 *
 * If it successfully processes this file, then the GNU Flex program should generate one of the
 * following output file ;
 *
 *   - lex.yy.c   # If the Scanner has been implemented in C.
 *   - lex.yy.cc  # If the Scanner has been implemented in C++.
 */


%{
// %option noyywrap
// %option c++

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <iostream>


using std::cout;
using std::endl;


#define STANDALONE_SCANNER  1

#ifdef STANDALONE_SCANNER
#define UUID                100
#define COMMAND_ECHO_UUID   101
#define COMMAND_CONNECT     102
#define COMMAND_DISCONNECT  103
#define COMMAND_EXIT        104
#define COMMAND_QUIT        105
#define COMMAND_HELP        106
#define LPAREN              107
#define RPAREN              108
#define RETURN_VALUE(returnCode)
#else
#include "myGrammar.tab.h"
// Includes Token type definitions
#endif


#ifdef STANDALONE_SCANNER

#else
#define RETURN_VALUE(returnCode) ({return(returnCode);})
#endif
%}

%option yylineno


%%

[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered a UUID" << endl;
	cout << "Length of UUID in chars                = "             << strlen(yytext) << endl;
	cout << "Address in memory of UUID              = "             << & yytext       << endl;
	cout << "Value of UUID Token type               = "             << UUID           << endl;
	cout << "UUID encountered                       : "             << yytext         << endl;
    cout << endl;

    RETURN_VALUE(UUID);
}
"echoUUID"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : echoUUID" << endl;
	cout << "Length of token in chars               = " << strlen(yytext) << endl;
	cout << "Address in memory of token             = " << & yytext << endl;
	cout << "Value of COMMAND_ECHO_UUID Token type  = " << COMMAND_ECHO_UUID << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_ECHO_UUID);
}
"connect"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : connect" << endl;
	cout << "Length of token in chars               = " << strlen(yytext) << endl;
	cout << "Address in memory of token             = " << & yytext << endl;
	cout << "Value of COMMAND_CONNECT Token type    = " << COMMAND_CONNECT << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_CONNECT);
}
"disconnect"     {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : disconnect" << endl;
	cout << "Length of token in chars               = " << strlen(yytext) << endl;
	cout << "Address in memory of token             = " << & yytext << endl;
	cout << "Value of COMMAND_DISCONNECT Token type = " << COMMAND_DISCONNECT << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_DISCONNECT);
}
"help"           {

    RETURN_VALUE(COMMAND_HELP);
}
"exit"           {RETURN_VALUE(COMMAND_EXIT);}
"quit"           {return(COMMAND_QUIT);}
"("              {return(LPAREN);}
")"              {return(RPAREN);}
[,;]             {return(yytext[0]);}
"//".*           /* Don't process C++ style line comments.
                    Recall that flex's default action is to discard any characters which match. */
[ \t\n]          ;
.                {printf("The Scanner/Tokenizer has encountered the following character which is either invalid, or does not form part of a keyword : %c\n", yytext[0]);}
%%
// The function yywrap will be called by the Lexer when input is exhausted.
//
// Return 0 if more processing is required or 1 otherwise.
int
yyFlexLexer::yywrap
(
)
{
	return(1);
}
int
main
(
 void
)
{
	int           valueReturn = 1;

	int           num_lines,
	              num_chars,
	              countWords;

	yyFlexLexer * lexer_p = new yyFlexLexer();


    // Prevent the Compiler from complaining that the following variables are unused.
    num_lines  = 0;
    num_chars  = 0;
    countWords = 0;
    // Prevent the Compiler from complaining that the following function is unused.
    if (false)
    {
        char   buffer[10];
		// yyunput(0, buffer);
    }
    cout << endl;
    cout << "================================================================================" << endl;
    cout << "This is a very basic Lexical Scanner which has been implemented using GNU Flex. " << endl;
    cout << endl;
    cout << "Enter some characters on the line and then press Enter when you are done.       " << endl;
    cout << endl;
    cout << "Press Ctrl + D on a line all by itself to finish passing charecters to the      " << endl;
    cout << "Lexical Scanner and by doing so, causing it to quit.                            " << endl;
    cout << ""                                                                                 << endl;
    cout << "List of valid keywords which the Scanner will understand;"                        << endl;
    cout << ""                                                                                 << endl;
    cout << "  echoUUID"                                                                       << endl;
    cout << "  connect"                                                                        << endl;
    cout << "  disconnect"                                                                     << endl;
    cout << "  quit"                                                                           << endl;
    cout << "================================================================================" << endl;
    cout << endl;
    while
    (
     (valueReturn != 0)            &&
     (valueReturn != COMMAND_EXIT) &&
     (valueReturn != COMMAND_QUIT)
    )
    {
        if (valueReturn == COMMAND_HELP)
        {
            cout << endl;
            cout << "Help functionality has not been implemented as yet!" << endl;
            cout << endl;
        }
		valueReturn = lexer_p->yylex();
    }
    printf("\n");
    printf("Value returned from the yylex function = %d\n", valueReturn);
    return(0);
}