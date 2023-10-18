all:
	bison -d bison_final.y
	flex flex_final.l
	gcc -o myParser.exe lex.yy.c bison_final.tab.c

clean:
	rm -f myParser.exe