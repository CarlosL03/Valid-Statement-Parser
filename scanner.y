/*** Carlos Lopez ***/

/*** Definition section ***/
%{ 
    #include <stdio.h>

    extern FILE* yyin;
    extern int yylex();
    extern int yyparse();
    void yyerror(const char *s);
%}

%error-verbose

%union{
    char *print;
}

%token EQU
%token <print> ID
%token EOL
%token <print> OP
%token OPEN_PAREN
%token CLOSE_PAREN
%token NEWLINE
%token UNKNOWN

%%
/*** Rules section ***/
stmts: statement
    | stmts statement 
    ;
statement: assignment NEWLINE {printf("\t\t-- valid\n");}
    | expression NEWLINE {printf("\t\t-- valid\n");}
    | error NEWLINE {yyerrok;}
    | NEWLINE
    ;

assignment: ID {printf("%s",$1);} EQU {printf(" = ");} expression EOL {printf(" ; ");}
    ;

expression: term
    | expression op term
    ;

term: id
    | OPEN_PAREN {printf("(");} expression op term CLOSE_PAREN {printf(")");}
    ;

id : ID                 {printf("%s", $1);};
op : OP                 {printf(" %s ", $1);};

%%
/*** C Code section ***/
int main(int argc, char **argv) {
    FILE* inputFile = fopen("scanme.txt", "r");
    yyin = inputFile;
    yyparse();
}

void yyerror(const char *s) {
    printf("\t\t\t\t -- invalid: ");
    printf("%s ",s);
    printf("\n");
}
