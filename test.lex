%namespace GPTest

%%

"print"	{ return (int)Tokens.print; }
"exit"	{ return (int)Tokens.exit_command; }
[a-zA-Z]	{ yylval.id = yytext[0]; return (int)Tokens.identifier; }
[0-9]+	{ yylval.num = int.Parse(yytext); return (int)Tokens.number; }
[ \t\r\n]	;
[\-+=;]	{ return yytext[0]; }
.	{ ECHO(); yyerror("unexpected character"); }

%%

protected override bool yywrap() { return true; }

public override void yyerror(string s, params object[] @params)
{
	Console.Error.WriteLine(s, @params);
}
