#include <string>
// std::string
#include <iostream>
// std::cout, std::cin, std::endl

#include <lex.yy.hpp>
// yyparse

#include <SimpleParser.tab.hpp>


using std::string;
using std::cout;
using std::cin;
using std::endl;


/*
void
yyerror
(
 char
 const * message
)
{
    const
    string   nameMethod = "yyerror : ";


    cout << nameMethod << "Enter" << endl;

    cout << "Error : " << message << endl;

    cout << nameMethod << "Exit" << endl;
}
 */


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


int
main
(
 void
)
{
    const
    string        nameMethod = "main : ";

    char          answer;

    int           returnCode;

    yyFlexLexer * lexer_p = new yyFlexLexer();

    yy::parser  * parser_p = new yy::parser();


    cout << nameMethod << "Enter" << endl;

    cout << endl;
    cout << "Press 's' to test the Scanner or anything else to test the Parser ...> ";

    cin >> answer;

    if
    (
     (answer == 's') ||
     (answer == 'S')
    )
    {
        // The user wants to start the Scanner running.
        //
        //   - Display a startup message to the user.
        //   - Start the Scanner running.

        displayStartupMessage();

        // Start the Scanner running.

        while
        (
         (returnCode != 0)
         /*
         &&
         (returnCode != yy::parser::token::COMMAND_EXIT)
         &&
         (returnCode != yy::parser::token::COMMAND_QUIT)
          */
        )
        {
            returnCode = lexer_p->yylex();

            // Display the value of the token which has been returned by the Lexer.

            cout << endl;
            cout << "Value returned from the yylex function = " << returnCode << endl;
        }
    }
    else
    {
        // Start the Parser running.

        returnCode = parser_p->parse();
    }


    cout << nameMethod << "Exit" << endl;
}