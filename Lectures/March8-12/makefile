ex: exd
	lex ex.lex
	yacc ex.yacc
	gcc y.tab.c lex.yy.c -o ex

exd: ex.lex ex.yacc
	lex -d ex.lex
	yacc -d ex.yacc
	gcc y.tab.c lex.yy.c -o exd

clean:
	rm -f y.tab.c y.tab.h lex.yy.c exd ex
