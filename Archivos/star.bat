del y.tab.c
del lex.yy.c
flex Scanner.l
bison -yd Parser.y
gcc y.tab.c lex.yy.c -o salida
salida
pause