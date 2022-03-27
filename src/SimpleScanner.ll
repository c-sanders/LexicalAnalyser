/*
 * The GNU Flex program should be used to process this file.
 *
 * The code in this file can be used by the GNU Flex program and the GNU C++ compiler, to implement
 * a very basic Lexical Scanner. The code which is contained within this file, implements the
 * Lexical Scanner using the C++ programming language. One of the consequences of it being
 * implemented using the C++ programming language, is that it needs to be processed appropriately.
 * The following point(s) should be taken into account when using the GNU Flex program to process
 * this file.
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


using std::string;
using std::cout;
using std::endl;


#define STANDALONE_SCANNER  1

#ifdef STANDALONE_SCANNER

#define UUID                100
#define COMMAND_ECHO_UUID   101
#define COMMAND_CREATE_NODE 102
#define COMMAND_CONNECT     103
#define COMMAND_DISCONNECT  104
#define COMMAND_EXIT        105
#define COMMAND_QUIT        106
#define COMMAND_HELP        107
#define LPAREN              108
#define RPAREN              109
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

    /*
     * Grammar for defining valid UUID values.
     *
     * Example of a valid UUID value;
     *
     *   028F37D3-6398-773F-8CF9-3829F7D3AA02
     */

[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered a UUID" << endl;
	cout << "Length of UUID in chars                = "             << strlen(yytext) << endl;
	cout << "Address in memory of UUID              = "             << & yytext       << endl;
	cout << "Value of UUID Token type               = "             << UUID           << endl;
	cout << "UUID encountered                       : "             << yytext         << endl;
    cout << endl;

    // Where does the following value get returned to?

    // RETURN_VALUE(UUID);

    // This following line of code will cause the yylex function to return.

    // return(UUID);
}

"echoUUID"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : echoUUID" << endl;
	cout << "Length of token in chars               = " << strlen(yytext) << endl;
	cout << "Address in memory of token             = " << & yytext << endl;
	cout << "Value of COMMAND_ECHO_UUID Token type  = " << COMMAND_ECHO_UUID << endl;
    cout << endl;

    // Where does the following value get returned to?

    // RETURN_VALUE(COMMAND_ECHO_UUID);

    return(COMMAND_ECHO_UUID);
}

[_a-zA-Z]{1}[_a-zA-Z0-9]{254} {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : Valid variable name" << endl;
	cout << "Length of token in chars                = " << strlen(yytext) << endl;
	cout << "Address in memory of token              = " << & yytext << endl;
	cout << "Value of COMMAND_CREATE_NODE Token type = " << COMMAND_CREATE_NODE << endl;
    cout << endl;

    // Where does the following value get returned to?

    // RETURN_VALUE(COMMAND_CREATE_NODE);

    return(COMMAND_CREATE_NODE);
}

"createNode" {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : createNode" << endl;
	cout << "Length of token in chars                = " << strlen(yytext) << endl;
	cout << "Address in memory of token              = " << & yytext << endl;
	cout << "Value of COMMAND_CREATE_NODE Token type = " << COMMAND_CREATE_NODE << endl;
    cout << endl;

    // Where does the following value get returned to?

    // RETURN_VALUE(COMMAND_CREATE_NODE);

    return(COMMAND_CREATE_NODE);
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

"disconnect"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : disconnect" << endl;
	cout << "Length of token in chars               = " << strlen(yytext) << endl;
	cout << "Address in memory of token             = " << & yytext << endl;
	cout << "Value of COMMAND_DISCONNECT Token type = " << COMMAND_DISCONNECT << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_DISCONNECT);
}

"help"  {

    cout << endl;
    cout << "Scanner/Tokenizer has encountered the token : help" << endl;
	cout << "Length of token in chars               = " << strlen(yytext) << endl;
	cout << "Address in memory of token             = " << & yytext << endl;
	cout << "Value of COMMAND_HELP Token type       = " << COMMAND_HELP << endl;
    cout << endl;

    RETURN_VALUE(COMMAND_HELP);
}

"exit"           {

    RETURN_VALUE(COMMAND_EXIT);
}

"quit"           {

    // Instruct yylex to exit with a return value of COMMAND_QUIT.

    return(COMMAND_QUIT);
}

"("              {return(LPAREN);}
")"              {return(RPAREN);}
[,;]             {return(yytext[0]);}
"//".*           /* Don't process C++ style line comments.
                    Recall that flex's default action is to discard any characters which match. */
[ \t\n]          ;
.                {
    cout << "The Scanner/Tokenizer has encountered the following character which is either ";
    cout << "invalid, or does not form part of a keyword : " << yytext[0] << endl;
}

%%

// The function yywrap will be called by the Lexer when the input is exhausted.
//
// Return 0 if more processing is required or 1 otherwise.

int
yyFlexLexer::yywrap
(
)
{
    const
    string   nameMethod = "yywrap";


    // cout << nameMethod << " : Enter" << endl;

    cout << "Function " << nameMethod << " has been invoked." << endl;

    // cout << nameMethod << " : Exit" << endl;

	return(1);
}


// -------------------------------------------------------------------------------------------------
// Forward declaration of helper functions.
// -------------------------------------------------------------------------------------------------

void
setupRoutine
(
 int         *,
 int         *,
 int         *,
 yyFlexLexer *
);


void
displayStartupMessage
(
 void
);


/*
 * Does the following code behave as a Parser?
 *
 * The reason I ask this is because it creates a Lexer (an instance of yyFlexLexer) and invokes it.
 */

int
main
(
 void
)
{
	int           valueReturn = 1;

	int           num_lines  = 0,
	              num_chars  = 0,
	              countWords = 0;

	yyFlexLexer * lexer_p = new yyFlexLexer();


    setupRoutine
    (
     & num_lines,
     & num_chars,
     & countWords,
     lexer_p
    );

    displayStartupMessage();

    // Ask the Lexer/Tokeniser for the next available token from the pipeline.
    //
    // Keep doing this inside of a loop until the Lexer returns one of three possible values which
    // should force the loop to exit.
    //
    // The Lexer is pointed to by the variable lexer_p.

    while
    (
     (valueReturn != 0)            &&
     (valueReturn != COMMAND_EXIT) &&
     (valueReturn != COMMAND_QUIT)
    )
    {
        valueReturn = lexer_p->yylex();

        // Display the value of the token which has been returned by the Lexer.

        cout << endl;
        cout << "Value returned from the yylex function = " << valueReturn << endl;
    }


    return(0);
}


void
setupRoutine
(
 int         * num_lines_p,
 int         * num_chars_p,
 int         * countWords_p,
 yyFlexLexer * lexer_p
)
{
    // char   buffer[10] = "";


    // By receiving the three variables as arguments, this function effectively prevents the
    // Compiler from complaining that the variables which are passed to it are unused.

    // Prevent the Compiler from complaining that the following function is unused.

    // lexer_p->yyunput(0, buffer);

    /*
    if (false)
    {



		if (strlen(buffer) == 0)
		{
		    // Do nothing. This code is just here to keep the compiler from complaining.
		}

		// lexer_p->yyunput(0, buffer);
    }
     */
}


void
displayStartupMessage
(
 void
)
{
    cout << endl
         << "================================================================================" << endl
         << "This is a very basic Lexical Scanner which has been implemented using GNU Flex. " << endl
                                                                                               << endl
         << "Enter some characters on the line and then press Enter when you are done.       " << endl
                                                                                               << endl
         << "Press Ctrl + D on a line all by itself to finish passing characters to the      " << endl
         << "Lexical Scanner and by doing so, causing it to quit.                            " << endl
                                                                                               << endl
         << "List of valid keywords which the Scanner will understand;"                        << endl
                                                                                               << endl
         << "  help"                                                                           << endl
         << "  echoUUID"                                                                       << endl
         << "  createNode"                                                                     << endl
         << "  connect"                                                                        << endl
         << "  disconnect"                                                                     << endl
         << "  quit"                                                                           << endl
         << "================================================================================" << endl
         << endl;
}