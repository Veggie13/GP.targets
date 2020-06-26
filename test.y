%namespace GPTest

%{
int[] symbols = new int[52];

public Parser(System.IO.Stream stream) : base(new Scanner(stream)) {}
%}

%union {public int num; public char id;}
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%type <num> line exp term
%type <id> assignment

%%

line	: assignment ';'	{;}
		| exit_command ';'	{ Environment.Exit(0); }
		| print exp ';'	{ Console.WriteLine("Printing {0}", $2); }
		| line assignment ';'	{;}
		| line print exp ';'	{ Console.WriteLine("Printing {0}", $3); }
		| line exit_command ';'	{ Environment.Exit(0); }
		;

assignment	: identifier '=' exp	{ updateSymbolVal($1, $3); }
			;

exp	: term	{ $$ = $1; }
	| exp '+' term	{ $$ = $1 + $3; }
	| exp '-' term	{ $$ = $1 - $3; }
	;

term	: number	{ $$ = $1; }
		| identifier	{ $$ = symbolVal($1); }
		;

%%

int computeSymbolIndex(char token)
{
	int idx = -1;
	if (char.IsLower(token))
	{
		idx = token - 'a' + 26;
	}
	else if (char.IsUpper(token))
	{
		idx = token - 'A';
	}
	return idx;
}

int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}
