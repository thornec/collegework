%{


%}



/* recognize tokens for the calculator and print them out */
%%
"+"				{ printf("PLUS "); }
"-"				{ printf("MINUS "); }
"*"				{ printf("TIMES "); }
"/"				{ printf("DIVIDE "); }
"|"				{ printf("ABS "); }
[0-9]+ 			{ printf("NUMBER %s ", yytext); }
\				{ printf("NEWLINE "); }
[ \t] 			{ }
.				{ printf("Mystery character %s\n", yytext); }
%%
