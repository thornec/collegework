%{
;Variable to keep track of single brackets to ensure they are matched and it is a valid comment;
int unfinishedComment = 0;

%}

%%

\".*\"		{printf("%s", yytext);}

"**".*		{}	; Comment do nothing
"{"		{unfinishedComment = 1;}
"}"		{if(unfinishedComment == 0){printf("syntax error\n"); return 0;} comment = 0;}

\n		{if(unfinishedComment == 0){printf("%s", yytext);}}
.		{if(unfinishedComment == 0){printf("%s", yytext);}}

%%

int main()
{
	yylex();

	if(unfinishedComment == 1) printf("syntax error\n");

	return 0;
}