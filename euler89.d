import std.stdio, std.string, std.range, std.math;
//using hashmaps and unit tests
void main(){

	auto numbers = File("roman.txt", "r");
	int tally = 0L;
	foreach(line; numbers.byLine())
		tally += line.length - romanlen(romantodec(cast(string)line));

writeln(tally);
}

unittest {
assert(romanlen(6) == 2);
assert(romantodec("VI") == 6);
assert(romanlen(romantodec("IV")) == 2);
}

int  romantodec(string romans){
	int[char] values = [
		'I':1,
		'V': 5,
		'X':10,
		'L': 50,
		'C': 100,
		'D': 500,
		'M': 1000
	];

	int sum = 0;
	foreach(long i; 0 .. romans.length -  1){

		int first = values[romans[i]];
		int next = values[romans[i+1]];

		if(next <= first) sum += first;
		else sum -= first;
	}
		sum += values[romans[$ - 1]];
		return sum;
}

int romanlen(int dec){
int length = 0;

int[] values = [1000, 500, 100, 50, 10, 5, 1];
int[] lessvalues = [900, 400, 90, 40, 9, 4, 0];
foreach(int index, int numeral; values){
	while (dec >= numeral){dec -= numeral; length++;}
	int smaller = lessvalues[index];
	if (dec >= smaller && smaller != 0){dec -= smaller; length += 2;}
}

return length;

}



