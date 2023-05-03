#cc=clang
cc=/Users/dio/Repository/goron/build/bin/clang

program:
	@${cc} main.c -o main

obfu:
	@${cc} -mllvm -irobf -mllvm --irobf-indbr main.c -o main

clean:
	@-rm -rf main