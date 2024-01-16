%option noyywrap
%option nounput
%option noinput

%{
    #include <cstdlib>
    #include <string>
    #include "BaseAST.h"
    #include "cf.tab.hpp"
    using namespace std;

    void yyerror(std::unique_ptr<BaseAST> &ast, const char *s);
%}

WhiteSpace    [ \t\n\r]*
LineComment   "//".*

Identifier    [a-zA-Z_][a-zA-Z0-9_]*

Decimal       [1-9][0-9]*
Octal         0[0-7]*
Hexadecimal   0[xX][0-9a-fA-F]+

%%

{WhiteSpace}    { /* 忽略, 不做任何操作 */ }
{LineComment}   { /* 忽略, 不做任何操作 */ }

"int"           { return INT; }
"return"        { return RETURN; }

{Identifier}    { yylval.str_val = new string(yytext); return IDENT; }
{Decimal}       { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Octal}         { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Hexadecimal}   { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }

.               { return yytext[0]; }

%%

/* 当需要和bison通信时，不再进行在这里用C/C++处理逻辑 */
// int main(int argc, char **argv)
// {
//   yylex();
//   yywrap();
// }
// int yywrap()
// {
// 	return 1;
// }
