//compile with dmd -J. euler99.d
/* Goals for later reimplementation 

Clean up line count (Was going to do it with a foreach loop but
that didn't work for some reason)

*/
import std.stdio, std.range,
std.conv, std.string, std.math;
void main(){
	auto numbers = File("base_exp.bin", "r");
	real max = 0;
	auto lines = numbers.byLine();
	int linecnt = 1;
	int lineno = 0;	
	foreach(line; lines){
		string[] expair = cast(string[]) split(line, ",");
		real base = log(to!int(expair[0]));
		int exp = to!int(expair[1]);
		
		real v = base * exp;
		if (max < v){max = v; lineno = linecnt;}
		
	linecnt++;
	}	

	writeln(lineno);
}
