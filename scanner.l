/*** Carlos Lopez, REDID: 827117558 ***/

%{
    #include <stdio.h>

    #include "scanner.tab.h"
%}

%%

[a-zA-Z][a-zA-Z0-9]*    {yylval.print = strdup(yytext); return ID;}
;					    {return EOL;}
[-+*/%]					{yylval.print = strdup(yytext); return OP;}
=						{return EQU;}
\(  					{return OPEN_PAREN;}
\)						{return CLOSE_PAREN;}
[0-9]+					;
\n						{return NEWLINE;}
\r 						;
[[:space:]]				;
.						{return UNKNOWN;}
%%