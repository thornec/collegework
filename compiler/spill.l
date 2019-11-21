%{


%}

%%
p[a-z]I { /*Do Nothing */ }		//Single Line Comment


%%

main(int argc, char **argv)
{
	yylex();
	printf("%d\n",yylex());
}