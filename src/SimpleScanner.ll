/*
 * The flex utility should be used to process this file.
 *
 * It can be instructed to process this file, with a command which is similar to the following ;
 *
 *   > flex ./myScanner.ll
 *
 * If it successfully processes this file, then flex should generate the following output file ;
 *
 *   - lex.yy.c
 */


%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <iostream>


using std::cout;
using std::endl;


// #include "myGrammar.tab.h"
// Includes Token type definitions

#define STANDALONE_SCANNER  1

#define UUID                100
#define COMMAND_ECHO_UUID   101
#define COMMAND_CONNECT     102
#define COMMAND_DISCONNECT  103
#define COMMAND_EXIT        104
#define COMMAND_QUIT        105
#define COMMAND_HELP        106
#define LPAREN              107
#define RPAREN              108


#ifndef STANDALONE_SCANNER
#define RETURN_VALUE(returnCode) ({return(returnCode);})
#else
#define RETURN_VALUE(returnCode)
#endif
%}

%option yylineno


%%

[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered a UUID" << endl;
    cout << "Length of UUID in chars   = "             << strlen(yytext) << endl;
    cout << "Address in memory of UUID = "             << & yytext       << endl;
    cout << "Value of UUID code        = "             << UUID           << endl;
    cout << "UUID encountered          : "             << yytext         << endl;
    cout << endl;

    RETURN_VALUE(UUID);
}
"echoUUID"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : echoUUID" << endl;
    cout << "Length of token in chars        = " << strlen(yytext) << endl;
    cout << "Address in memory of token      = " << & yytext << endl;
    cout << "Value of COMMAND_ECHO_UUID code = " << COMMAND_ECHO_UUID << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_ECHO_UUID);
}
"connect"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : connect" << endl;
    cout << "Length of token in chars      = " << strlen(yytext) << endl;
    cout << "Address in memory of token    = " << & yytext << endl;
    cout << "Value of COMMAND_CONNECT code = " << COMMAND_CONNECT << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_CONNECT);
}
"disconnect"     {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : disconnect" << endl;
    cout << "Length of token in chars         = " << strlen(yytext) << endl;
    cout << "Address in memory of token       = " << & yytext << endl;
    cout << "Value of COMMAND_DISCONNECT code = " << COMMAND_DISCONNECT << endl;
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

int
main
(
 void
)
{
    int   valueReturn = 1;

    int   num_lines,
          num_chars,
          countWords;


    // Prevent the Compiler from complaining that the following variables are unused.

    num_lines  = 0;
    num_chars  = 0;
    countWords = 0;

    // Prevent the Compiler from complaining that the following function is unused.

    if (false)
    {
        char   buffer[10];


        yyunput(0, buffer);
    }

    cout << endl;
    cout << "================================================================================" << endl;
    cout << "This is a very basic Lexical Scanner which has been implemented using GNU Flex. " << endl;
    cout << endl;
    cout << "Enter some characters on the line and then press Enter when you are done.       " << endl;
    cout << endl;
    cout << "Press Ctrl + D on a line all by itself to finish passing charecters to the      " << endl;
    cout << "Lexical Scanner and by doing so, causing it to quit.                            " << endl;
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

        valueReturn = yylex();
    }

    printf("\n");
    printf("Value returned from the yylex function = %d\n", valueReturn);

    return(0);
}
