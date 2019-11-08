import std.stdio, std.conv;

void main(){
	int count = 0;
	foreach(long i; 1 .. 10_000_000){
		if (chainendswith(i) == 89) count++;
	}

writeln(count);
}


long[] getDigits(long x){
	auto stringdig = to!string(x);
	auto digits = new long[stringdig.length];
	foreach(index, ref item; digits){
		item = cast(int) stringdig[index] - '0';
	}
	return digits;
}

long chainendswith(long x){

	int no1s = 0;
	int no89s = 0;
	while (true){
		long newx = 0L;
		foreach(long i; getDigits(x)){
			newx += cast(long) i^^2;
		}x = newx;
		if (x == 1) no1s++;
		if (x == 89) no89s++;
		if (no1s == 2) return 1;
		if (no89s == 2) return 89;
	}
}

unittest{
writeln(getDigits(18));
writeln(getDigits(120202));
writeln(getDigits(2));
}
